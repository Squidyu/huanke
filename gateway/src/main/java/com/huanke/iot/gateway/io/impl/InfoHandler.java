package com.huanke.iot.gateway.io.impl;

import com.alibaba.fastjson.JSON;
import com.huanke.iot.base.dao.impl.device.data.DeviceInfoMapper;
import com.huanke.iot.base.po.device.data.DeviceInfoPo;
import com.huanke.iot.gateway.io.AbstractHandler;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Slf4j
public class InfoHandler extends AbstractHandler {

    @Autowired
    private DeviceInfoMapper deviceInfoMapper;

    @Data
    private static class InfoItem {
        private String imei;
        private String imsi;
        private String mac;
        private VersionItem version;
        private WxInfoItem wx_info;

    }

    @Data
    private static class WxInfoItem {
        private String dev_id;
        private String dev_license;
    }

    @Data
    private static class VersionItem {
        private String software;
        private String hardware;
    }

    @Override
    protected String getTopicType() {
        return "info";
    }

    @Override
    public void doHandler(String topic, byte[] payloads) {
        String message = new String(payloads);
        InfoItem infoItem = JSON.parseObject(message, InfoItem.class);
        if (infoItem != null) {
            DeviceInfoPo deviceInfoPo = new DeviceInfoPo();
            String devId = "";
            if (infoItem.getWx_info() != null &&
                    StringUtils.isNotEmpty(infoItem.getWx_info().getDev_id())) {
                devId = infoItem.getWx_info().getDev_id();
            }
            if (StringUtils.isEmpty(devId)) {
                log.warn("devId {} is blank ", devId);
                return;
            }
            try {
                DeviceInfoPo queryDeviceInfo = deviceInfoMapper.selectByDevId(devId);
                if (queryDeviceInfo != null) {
                    DeviceInfoPo updatePo = new DeviceInfoPo();
                    updatePo.setId(queryDeviceInfo.getId());
                    updatePo.setVersion(JSON.toJSONString(infoItem.getVersion()));
                    updatePo.setLastUpdateTime(System.currentTimeMillis());
                    deviceInfoMapper.updateById(updatePo);
                } else {
                    deviceInfoPo.setImei(infoItem.getImei());
                    deviceInfoPo.setImsi(infoItem.getImsi());
                    deviceInfoPo.setMac(infoItem.getMac());
                    deviceInfoPo.setCreateTime(System.currentTimeMillis());
                    deviceInfoPo.setVersion(JSON.toJSONString(infoItem.getVersion()));
                    deviceInfoMapper.insert(deviceInfoPo);
                }
            } catch (Exception e) {
                log.error("", e);
            }
        }
    }
}
