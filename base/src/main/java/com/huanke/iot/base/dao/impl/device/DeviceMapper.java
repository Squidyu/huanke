package com.huanke.iot.base.dao.impl.device;

import com.huanke.iot.base.dao.BaseMapper;
import com.huanke.iot.base.po.device.DevicePo;

public interface DeviceMapper extends BaseMapper<DevicePo>{

    DevicePo selectByDeviceId(String deviceId);


    int updateByDeviceId(DevicePo devicePo);
}
