package com.huanke.iot.api.util;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;

import java.nio.ByteOrder;

public class FloatDataUtil {
    public static String getFloat(int a){
       double left = a/100.00;
       return ""+left;
    }
    public static void main(String[] args) {
        int a = 800;

        System.out.println("args = [" + getFloat(111) + "]");
    }
}
