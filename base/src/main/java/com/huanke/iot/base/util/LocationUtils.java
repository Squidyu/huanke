package com.huanke.iot.base.util;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URI;
import java.util.concurrent.TimeUnit;

@Service
@Slf4j
public class LocationUtils {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    public JSONObject getLocation(String ip,boolean needReset) {
        if (StringUtils.isEmpty(ip)) {
            return null;
        }
        String deviceIpStr = stringRedisTemplate.opsForValue().get(ip);
        if (StringUtils.isEmpty(deviceIpStr)) {
            if(needReset) {
                JSONObject jsonObject = doGetLocation(ip);
                if (jsonObject != null) {
                    stringRedisTemplate.opsForValue().set(ip+".location",jsonObject.toJSONString());
                    stringRedisTemplate.expire(ip+".location",2, TimeUnit.MINUTES);

                }
            }
            return null;
        }
        return JSON.parseObject(deviceIpStr);
    }

    public JSONObject getWeather(String ip,boolean needReset) {
        if (StringUtils.isEmpty(ip)) {
            return null;
        }
        String deviceIpStr = stringRedisTemplate.opsForValue().get(ip);
        if (StringUtils.isEmpty(deviceIpStr)) {
            if(needReset) {
                JSONObject jsonObject = doGetWeather(ip);
                if (jsonObject != null) {
                    stringRedisTemplate.opsForValue().set(ip+".weather", jsonObject.toJSONString());
                    stringRedisTemplate.expire(ip+".weather",2, TimeUnit.MINUTES);
                }
            }
            return null;
        }
        return JSON.parseObject(deviceIpStr);
    }



    public JSONObject doGetWeather(String ip) {
        if (StringUtils.isEmpty(ip)) {
            return null;
        }
        String url = String.format("http://api.k780.com:88/?app=weather.today&weaid=%s&appkey=33302&sign=96b4d475536090dac84ff04daa37d785&format=json",
                ip);
        try {
            HttpGet httpGet = new HttpGet();
            httpGet.setURI(new URI(url));

            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(3000).
                    setConnectTimeout(3000).build();//设置请求和传输超时时间
            httpGet.setConfig(requestConfig);
            CloseableHttpResponse response = HttpClients.createDefault().execute(httpGet);

            BufferedReader rd = new BufferedReader(
                    new InputStreamReader(response.getEntity().getContent()));

            StringBuilder result = new StringBuilder();
            String line = "";
            while ((line = rd.readLine()) != null) {
                result.append(line);
            }
            String ret = result.toString();
            JSONObject jsonObject = JSON.parseObject(ret);
            return jsonObject;
        } catch (Exception  e) {
            log.error("",e);
        }
        return null;
    }

    public JSONObject doGetLocation(String ip) {
        String url = String.format("http://api.map.baidu.com/location/ip?ak=omi69HPHpl5luMtrjFzXn9df&ip=%s&coor=bd09ll", ip);
        try {
            HttpGet httpGet = new HttpGet();
            httpGet.setURI(new URI(url));

            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(2000).
                    setConnectTimeout(3000).build();//设置请求和传输超时时间
            httpGet.setConfig(requestConfig);
            CloseableHttpResponse response = HttpClients.createDefault().execute(httpGet);
            BufferedReader rd = new BufferedReader(
                    new InputStreamReader(response.getEntity().getContent()));

            StringBuilder result = new StringBuilder();
            String line = "";
            while ((line = rd.readLine()) != null) {
                result.append(line);
            }
            String ret = result.toString();
            JSONObject jsonObject = JSON.parseObject(ret);
            return jsonObject;
        } catch (Exception e) {
            log.error("",e);
        }
        return null;
    }
}
