package com.huanke.iot.base.enums;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

/**
 * @author haoshijing
 * @version 2018年04月18日 09:43
 **/
public enum  FuncTypeEnums {
    MODE("210","模式","0,1", 2,3),
    ANION("220","负离子","0,1",2,3),
    UV("230","UV灯","0,1", 2,3),
    BANANA("240","香蕉","0,1",2,3),
    HUMIDIFER ("250","加湿器","0,1",2,3),
    DEHUMIDIFER("260","除湿器","0,1",2,3),
    CHILD_LOCK("270","童锁","0,1",2,3),
    WIND1("280","风速","1档,2档,3档,4档,5档,6档",2,3),
    WIND2("281","风速","1档,2档,3档,4档,5档,6档",2,3),
    WIND3("282","风速","1档,2档,3档,4档,5档,6档",2,3),
    WIND4("283","风速","1档,2档,3档,4档,5档,6档",2,3),
    VALVE1("290","循环阀1","0,90,180",2,3),
    VALVE2("291","循环阀2","0,90,180",2,3),
    TIMER_OEPN("310","定时开机","",3,3),
    TIMER_CLOSE("320","定时关机","",3,3),
    TIMER_SCREEN("330","滤网定时","",3,2),
    TIMER_CARBON("340","定时开机","",3,2),
    TIMER_REMAIN("350","可用时间","",3,2);
    FuncTypeEnums(String code,String mark,String range,int funcType,int operType){
        this.code = code;
        this.mark = mark;
        this.range = range;
        this.funcType = funcType;
    }
    @Getter
    @Setter
    private String code;
    @Getter @Setter
    private String mark;

    @Getter @Setter
    private int funcType;

    @Getter @Setter
    private String range;
    
    public static FuncTypeEnums getByCode(String code){
        for(FuncTypeEnums funcTypeEnums:FuncTypeEnums.values()){
            if(StringUtils.equals(funcTypeEnums.getCode(),code)){
                return funcTypeEnums;
            }
        }
        return null;
    }
}