package com.huanke.iot.base.dao.impl.device;

import com.huanke.iot.base.dao.BaseMapper;
import com.huanke.iot.base.po.device.DeviceTimerPo;

import java.util.List;

public interface DeviceTimerMapper extends BaseMapper<DeviceTimerPo>{
    List<DeviceTimerPo> selectTimerList(DeviceTimerPo deviceTimerPo);

    Integer cancelTimer(DeviceTimerPo updatePo);
}
