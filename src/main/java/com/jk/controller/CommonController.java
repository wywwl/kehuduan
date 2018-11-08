package com.jk.controller;

import com.jk.model.UserBean;
import com.jk.service.CommentService;
import com.jk.tool.PublicStatic;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("common")
public class CommonController {

    @Autowired
     CommentService commentService;

    private static Logger log = Logger.getLogger(CommonController.class);

    //每五秒钟调用一次，更新在线时间
    @ResponseBody
    @RequestMapping("updateuseronlinetime")
    public void updateuseronlinetime(HttpServletRequest request) {
        UserBean user=(UserBean) request.getSession().getAttribute(PublicStatic.USER);
        if(user!=null){
            Map<Integer, Long> map= (Map<Integer, Long>)request.getSession().getServletContext().getAttribute("updateuseronlinetime");
            if(map==null){
                map=new HashMap<Integer, Long>();
            }
            long l=System.currentTimeMillis();
            if(map.get(user.getId())==null||(l-map.get(user.getId())>4*1000)){
                commentService.updateuseronlinetime(user);
                map.put(user.getId(), l);
                request.getSession().getServletContext().setAttribute("updateuseronlinetime", map);
            }
        }
    }





}
