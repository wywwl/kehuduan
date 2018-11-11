package com.jk.util;

import com.jk.model.problem.UserBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UserBeanUtil {


    /**
     * 获取session用户Bean
     * @param request
     * @return
     */
    public static UserBean getUserInfo(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (UserBean) session.getAttribute("userInfo");
    }

/**
 * 获取session中的用户id
 * @param request
 * @return
 */
public static Integer getUserId(HttpServletRequest request) {
    HttpSession session = request.getSession();
    UserBean attribute = (UserBean)session.getAttribute("userInfo");
    return attribute == null ? 0 : attribute.getId();
}

}
