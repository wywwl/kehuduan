package com.jk.controller.UserController;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.userModel.UserBean;
import com.jk.service.userService.UserService;
import com.jk.util.RandomValidateCodeUtil;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 王玉荣
 *
 * 这是用户登陆用的
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 这是跳到登陆页面的方法
     * */
    @RequestMapping("tologin")
    public String tologin(){

        return "/user/login.jsp";
    }


    /**
     * 验证码
     * @param request
     * @param response
     */
    @RequestMapping("getVerify")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            /*logger.error("获取验证码失败>>>>   ", e);*/
        }
    }


    @RequestMapping("getVerifyxx")
    public void getVerifyxx(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            /*logger.error("获取验证码失败>>>>   ", e);*/
        }
    }

    /*
    * 登陆
    * */
    @RequestMapping("logining")
    @ResponseBody
    public String login(UserBean user, String loginCode , HttpServletRequest request){
        int flag = -1; //-1: 验证码错误 0：用户名不存在  1：密码错误 2：登录成功

        Map<String, Object> result = new HashMap<String,Object>();
        HttpSession session = request.getSession();
        String sessionCode = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(sessionCode.equals(loginCode)){
//			service层需要返回 标识字段的值，以及  如果登录成功返回登录人的完整信息
            JSONObject json = userService.loginuser(user);
            //获取 登录人信息 如果 登录人信息不为空 登录成功 ，将 信息存到session
            UserBean loginTeacher = (UserBean) json.get("loginTeacher");
            if(loginTeacher != null){
                request.getSession().setAttribute("userInfo", loginTeacher);
            }
            flag = json.getIntValue("flag");
        }
        return flag+"";
    }
    @RequestMapping("loginingttwo")
    @ResponseBody
    public String loginingttwo(UserBean user, String loginCode , HttpServletRequest request){
        int flag = -1; //-1: 验证码错误 0：用户名不存在  1：密码错误 2：登录成功

        Map<String, Object> result = new HashMap<String,Object>();
        HttpSession session = request.getSession();
        String sessionCode = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(sessionCode.equals(loginCode)){
//			service层需要返回 标识字段的值，以及  如果登录成功返回登录人的完整信息
            JSONObject json = userService.loginuser(user);
            //获取 登录人信息 如果 登录人信息不为空 登录成功 ，将 信息存到session
            UserBean loginTeacher = (UserBean) json.get("loginTeacher");
            if(loginTeacher != null){
                request.getSession().setAttribute("userInfo", loginTeacher);
            }
            flag = json.getIntValue("flag");
        }
        return flag+"";
    }

/*
    @RequestMapping("logining")
    @ResponseBody
    public Map<String,Object> login(UserBean user, String loginCode , HttpServletRequest request){
        Map<String, Object> result = new HashMap<String,Object>();
        HttpSession session = request.getSession();
        String code = (String) session.getAttribute("RANDOMVALIDATECODEKEY");

        if(!code.equals(loginCode)){
            result.put("msg",1);
            result.put("code","验证码错误");
            return result;
        }

        UserBean adminsInfo = userService.getUserByName(user.getName());

        if(adminsInfo == null){
            result.put("msg",2);
            result.put("code","用户不存在");
            return result;
        }

        String password = user.getUpwd();
        if(!password.equals(adminsInfo.getUpwd())){
            result.put("msg",3);
            result.put("code","密码错误");
            return result;
        }

        session.setAttribute(session.getId(), adminsInfo);
        result.put("msg",0);
        return result;
    }


    @RequestMapping("tolayouts")
    public String tolayouts(){
        return "/user/layouts.jsp";
    }*/

    /*
    * 跳到另一个登陆的页面
    * */
    @RequestMapping("todialog")
    private String todialog(){
        return "/user/dialog.jsp";
    }

    @RequestMapping("todailoging")
    private String todailoging(){
        return "/user/dialoging.jsp";
    }

    @RequestMapping("toadduser")
    public String  toadduser(){
        return "/user/toadduser.jsp";
    }
}
