package com.jk.controller.activeController;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.activeModel.ActiveBean;
import com.jk.service.activeService.ActiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 王玉荣
 * 这是活动的模块
 */
@RequestMapping("/active")
@Controller
public class ActiveController {

    @Autowired
    private ActiveService activeService;

        /*
        * 跳到查询的页面
        * */
    @RequestMapping("toindex")
    private String toindex(){
        return "/active/index.jsp";
    }


    /*
    * 来进行查询
    * */
    @RequestMapping("toqueryactive")
    @ResponseBody
    public Map<String, Object> queryactive(int page, int rows, ActiveBean activeBean){

        return activeService.queryactive(page,rows,activeBean);
    }

    @RequestMapping("remAactiveById")
    @ResponseBody
    public void remAactiveById(String ids){
        activeService.remAactiveById(ids);
    }

    @RequestMapping("addactive")
    public String addactive(){
        return "/active/addactive.jsp";
    }
}
