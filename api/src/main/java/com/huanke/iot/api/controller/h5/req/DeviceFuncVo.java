package com.huanke.iot.api.controller.h5.req;

import lombok.Data;

@Data
public class DeviceFuncVo {
    private String deviceId;
    private String funcId;
    private String value;
}
