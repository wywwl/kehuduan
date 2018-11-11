package com.jk.controller;

import com.jk.model.Mood;
import com.jk.model.UserBean;
import com.jk.service.CommentService;
import com.jk.tool.PublicStatic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.List;

@Controller
public class IndexController {

    private static Logger logger = LoggerFactory.getLogger(CommentController.class);

    @Autowired
    private RedisTemplate<String, String> redisTemplate;


    @Autowired
    private CommentService commentService;
   //心情展示
    @RequestMapping("toMoodList")
    public ModelAndView toMoodList(HttpServletRequest request,Mood mood) {
        ModelAndView model= new ModelAndView("/WEB-INF/comment/moodlist.jsp");
        List<Mood> moodList = commentService.getMoodList(mood);
        model.addObject("mood",moodList);
        System.out.println("封装的model="+model);
        return model;
    }



       @RequestMapping("toSaveMood")
       public String toSaveMood() {
           return "/WEB-INF/comment/saveMood.jsp";
       }

    //跳转修改密码
    @RequestMapping("topwd")
    public String topwd() {
        return "/WEB-INF/user/user-pwd.jsp";
    }
    //跳转强制修改密码
    @RequestMapping("topwds")
    public String topwds() {
        return "/WEB-INF/user/user-pwds.jsp";
    }




    // 展示用户资料的页面
   @RequestMapping("index")
    public String toindex(HttpServletRequest request, Model model ) throws ParseException {
       UserBean user=(UserBean) request.getSession().getAttribute(PublicStatic.USER);
       SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
       if(user==null){
           return "2";
       }
       else{
           String createtime = user.getCreatetime();
           Date parse = sim.parse(createtime);
           long time = parse.getTime();
           System.out.println("注册日期"+time);
           Long millisecond = Instant.now().toEpochMilli();  // 当前时间的精确到毫秒
           long l = millisecond -time ;
           long days = ((l+86400000) / (1000 * 60 * 60 * 24));//转换成天数
           System.out.println("tian"+days);
             long years=365;
           int Integer = Math.toIntExact(days / 365);
           double floor = Math.floor(Integer);
           user.setYears( floor);
           user.setWebage(floor+"年");
           model.addAttribute("user",user);
       }
        return "/WEB-INF/user/user-ziliao.jsp";
    }
    @RequestMapping("toquarter")
    public  String toquarter(){

        return "/WEB-INF/statis/quarter.jsp";
    }

    @RequestMapping("toSendemail")

    public  String toSendemail() {
        return "/WEB-INF/user/user-email.jsp";
    }

}
