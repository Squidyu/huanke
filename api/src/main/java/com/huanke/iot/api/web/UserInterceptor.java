package com.huanke.iot.api.web;

import com.alibaba.fastjson.JSON;
import com.huanke.iot.api.service.user.UserService;
import com.huanke.iot.base.api.ApiResponse;
import com.huanke.iot.base.constant.RetCode;
import org.apache.commons.lang.StringUtils;
import org.apache.http.entity.ContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Repository
public class UserInterceptor extends HandlerInterceptorAdapter {

    private static final String TICKET = "Ticket";
    @Autowired
    private UserService userService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String openId = request.getHeader(TICKET);
        if(StringUtils.isNotEmpty(openId)){
            Integer userId = userService.getUserIdByTicket(openId);
            if(userId != 0){
                return  true;
            }
        }

        ApiResponse apiResponse = new ApiResponse(RetCode.TICKET_ERROR,"没有获取到openId");
        response.setContentType(ContentType.APPLICATION_JSON.getMimeType());
        response.getWriter().print(JSON.toJSONString(apiResponse));
        return false;
    }
}
