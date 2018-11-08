package com.jk.controller;

import com.jk.model.*;
import com.jk.service.CommentService;
import com.jk.tool.PublicStatic;
import com.jk.tool.Tool;
import com.jk.util.ResultPage;
import com.jk.util.UserBeanUtil;
import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("comment")
@WebServlet(name = "CommentController",urlPatterns = "/savesession")
public class CommentController extends HttpServlet {

  private static Logger logger = LoggerFactory.getLogger(CommentController.class);



    @Autowired
    private CommentService commentService;

    @RequestMapping("query")
    public String queryComment(HttpServletRequest request, Comment comment) {
        try {
            //查询评论一级
          comment.setpCommentId(0);
            List<Comment> commentList = commentService.getCommentByPage(comment);// 查询评论
             request.setAttribute("list",commentList);


        } catch (Exception e) {
            logger.error("queryComment()--error", e);
        }
        return "/WEB-INF/comment/showcomment.jsp";
    }


@RequestMapping("toaddContent")

public   String toaddContent( ){

    return "/WEB-INF/admin/addContent.jsp";
}




    @RequestMapping("toAdminIndex")
    public   String toAdminIndex( ){

        return "/WEB-INF/admin/commentList.jsp";
    }



    @RequestMapping("toIndex")
    public   String toIndex(){

        return "/WEB-INF/comment/showcomment.jsp";
    }

    /**
     * （根据博客id）查询评论
     */
    @RequestMapping("queryComment")
    @ResponseBody
    List<Comment> queryComment(String bid){
        List<Comment> comments = commentService.queryComment(bid);
        List<String> tableNames=comments.stream().map(Comment::getContent).collect(Collectors.toList());
        System.out.println("书信为："+tableNames);
        return  comments;
    }
    @RequestMapping("queryAdminComment")
    @ResponseBody
    public ResultPage queryAdminComment(Comment comment){
        comment.setpCommentId(0);


      return commentService.queryAdminComment(comment);
    }
    // 添加评论
    @RequestMapping("saveComment")
    @ResponseBody
     public Map<String,Object> saveComment(HttpServletRequest request, Comment comment){
        Map<String, Object> json = new HashMap<>();
        String id="1";

        try {
           request.getSession().setAttribute(String.valueOf(id), "userInfo");
            // 如果用户未登录则不能评论
            int userId = UserBeanUtil.getUserId(request);
            if (userId == 0) {
                json .put("flg","1");//用户id为空
                return json;
            }
            // 登陆用户id
            comment.setUid(userId);
            // 添加评论
            commentService.saveComment(comment);
            json.put("flg","2");//发送成功

        } catch (Exception e) {
            json.put("flg","3");//发送失败
            logger.error("saveComment()--error", e);
        }

        return json;
    }


    /**+
     * 点赞功能
     */
    @RequestMapping("addPraise")
    @ResponseBody
    public  String addPraise(Integer id){

        commentService.addPraise(id);
        return "";
    }


    /**
     * 后台
     * @param ids
     * @return
     */
    @RequestMapping("dels")
    @ResponseBody
    String dels(String ids) {
        commentService.dels(ids);
        return null;
    }

    @RequestMapping("del")
    @ResponseBody
    String del(String id) {
        commentService.del(id);
        return null;
    }
    @RequestMapping("addContent")
    @ResponseBody
    String addContent(/*HttpServletRequest request,*/Comment comment, Admins admins){
        commentService.addContent(/*request, */comment, admins);
        return "{}";
    }

    @RequestMapping("getBlogData")
    @ResponseBody
    public  List<Blog>getBlogData(Blog blog){
        List<Blog> blogData= commentService.getBlogData(blog);
        return blogData;
    }

   @RequestMapping("registerUser")
    @ResponseBody
   public   Map<String,String> registerUser(HttpServletRequest request, UserBean user, String yanzhengma){
       HashMap<String, String> jsonmap = new HashMap<>();
       String flag="1";
       String msg="注册成功!";
       HttpSession session = request.getSession(true);
       String yanzhengmasession=(String)session.getAttribute("yanzhengma");
       if(!yanzhengma.equalsIgnoreCase(yanzhengmasession)){
           flag="0";
           msg="验证码错误！";
       }else if(user.getLogin().length()<6){
           flag="0";
           msg="用户名小于6位！";
       }else if(commentService.isusername(user.getLogin()).equals("0")){
           flag="0";
           msg="用户名重复！";
       }else if(user.getUpwds().length()<6){
           flag="0";
           msg="密码小于6位！";
       }else{
           session.removeAttribute("yanzhengma");
           user.setZhuceip(Tool.getIp(request));
           user.setCreatetime(Tool.getyyyyMMddHHmmss());
           user.setLastlogintime(Tool.getyyyyMMddHHmmss());
           user.setUpwds(Tool.MD5(user.getUpwds()));
           user.setFlag("1");
           user.setNbcount(2);
           user.setGrade(0);
           user.setJifen(2);
           user.setFile("/file/upload/f874801f-255b-4950-b238-94e3c2c1e7ed.jpg");
           commentService.insert(user);
           //注册用户 新增组的关联关系
           String loginname=user.getLogin();
           user=new UserBean();
           user.setLogin(loginname);
           user = commentService.findbyid(user);
           commentService.updategroupbyuser(user.getId(), PublicStatic.GROUPVIP);
       }
       jsonmap.put("flag", flag);
       jsonmap.put("msg", msg);
//		return "redirect:/login/index.do";
       return jsonmap;

   }


    //验证用户名
    @ResponseBody
    @RequestMapping("isusername")
    public String isusername(HttpServletRequest request,UserBean user) {
        String flag= (String) commentService.isusername(user.getLogin());
        return flag;
    }




    //登录
    @ResponseBody
    @RequestMapping("login")
    public Map<String, Object> login(HttpServletRequest request, UserBean user  ) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String yanzhengmasession=(String)session.getAttribute("yanzhengma");
       String yanzhengma="";
        if(yanzhengmasession!=null){
            yanzhengma=yanzhengmasession;
        }
        user.setYanzhengma(yanzhengma);
        String flag="0";
        String msg="0";

            Map<String, Object> map1 = commentService.login(user);
                 System.out.println(map1);
            if(map1.get("flag").equals("66")){
                user.setLoginip(Tool.getIp(request));
                request.getSession().setAttribute(PublicStatic.USER,map1.get(PublicStatic.USER));
            }


                user=(UserBean)request.getSession().getAttribute(PublicStatic.USER);
                Jifen jifen=new Jifen();
                jifen.setFenshu(PublicStatic.JIFEN_LOGIN);
        /*user.getId()*/
                jifen.setUserid(4);
                jifen.setType("104");
                jifen.setContent("每天第一次登录您获得"+PublicStatic.JIFEN_LOGIN+"积分");
                int findnowcount = commentService.findnowcount(jifen);
                if(findnowcount==0){
                    commentService.insertss(jifen);
                }



       /* map1.put("flag", flag);*/
        map1.put("msg", msg);
        return map1;
    }

    //退出
    @RequestMapping("logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }





    //修改密码
    @ResponseBody
    @RequestMapping("pwd")
    public String pwd(HttpServletRequest request,String pwd ,String newpwd) throws ServletException, IOException {

        UserBean users=(UserBean)request.getSession().getAttribute(PublicStatic.USER);
        if(users==null){
            return "2";
        }else{
        UserBean user=new UserBean();
        user.setId(users.getId());
        user.setUpwds(pwd);
        Map<String, Object> map = commentService.login(user);

        if("1".equals(map.get("flag").equals("66"))){
            user.setUpwds(Tool.MD5(newpwd));
            commentService.update(user);
            return "1";
        }else{
            return "0";
        }
        }
    }

    //跳转首页
    @RequestMapping("update")
    public String update(HttpServletRequest request, Model model, UserBean user) {
        UserBean sessionuser=(UserBean)request.getSession().getAttribute(PublicStatic.USER);
        user.setId(sessionuser.getId());
        commentService.update(user);

        user=commentService.findbyuserid(sessionuser.getId());
        request.getSession().setAttribute(PublicStatic.USER, user);
        return "redirect:/index";
    }





}
