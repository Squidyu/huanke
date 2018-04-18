package com.huanke.iot.api.controller.h5;

import com.alibaba.fastjson.JSONObject;
import com.huanke.iot.api.controller.h5.req.DeviceFuncVo;
import com.huanke.iot.api.controller.h5.response.DeviceDetailVo;
import com.huanke.iot.api.controller.h5.response.DeviceListVo;
import com.huanke.iot.api.service.device.basic.DeviceDataService;
import com.huanke.iot.api.service.device.basic.DeviceService;
import com.huanke.iot.base.api.ApiResponse;
import com.huanke.iot.base.dao.impl.device.data.DeviceOperLogMapper;
import com.huanke.iot.base.po.device.data.DeviceOperLogPo;
import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.RegEx;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author haoshijing
 * @version 2018年04月08日 10:33
 **/
@RequestMapping("/h5/api")
@RestController
public class DeviceController extends BaseController {

    @Autowired
    private DeviceService deviceService;

    @Autowired
    private DeviceOperLogMapper deviceOperLogMapper;

    @Autowired
    private DeviceDataService deviceDataService;
    @RequestMapping("/obtainMyDevice")
    public ApiResponse<DeviceListVo> obtainMyDevice(HttpServletRequest httpServletRequest){
        Integer userId = getCurrentUserId(httpServletRequest);
        DeviceListVo deviceListVo = deviceService.obtainMyDevice(userId);
        return new ApiResponse<>(deviceListVo);
    }

    @RequestMapping("/queryDetailByDeviceId/{deviceId}")
    public ApiResponse<DeviceDetailVo> queryDetailByDeviceId( String deviceId){
        DeviceDetailVo deviceDetailVo = deviceDataService.queryDetailByDeviceId(deviceId);
        return new ApiResponse<>(deviceDetailVo);
    }

    @RequestMapping("/editDevice")
    public ApiResponse<Boolean> editDevice(HttpServletRequest request,String deviceId,String deviceName){
        Integer userId = getCurrentUserId(request);
        boolean ret =  deviceService.editDevice(userId,deviceId,deviceName);
        return new ApiResponse<>(ret);
    }


    @RequestMapping("/sendFunc")
    public ApiResponse<String> sendFunc(@RequestBody DeviceFuncVo deviceFuncVo){
        String requestId = deviceDataService.sendFunc(deviceFuncVo);
        return new ApiResponse<>(requestId);
    }

    @RequestMapping("/queryResponse")
    public ApiResponse<JSONObject> queryResonse(String requestId){
        DeviceOperLogPo deviceOperLogPo = deviceOperLogMapper.queryByRequestId(requestId);
        if(deviceOperLogPo != null){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("ret",deviceOperLogPo.getDealRet());
            jsonObject.put("msg",deviceOperLogPo.getRetMsg());
            return new ApiResponse<>(jsonObject);
        }
        return new ApiResponse<>(new JSONObject());
    }


    @RequestMapping("/selectDataList")
    public ApiResponse<List<Integer>> selectDataList(String type, Long start , Long end){

        return new ApiResponse<>(Lists.newArrayList());
    }
}
