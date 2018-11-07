package com.jk.controller;

import com.jk.model.Admins;
import com.jk.model.Blog;
import com.jk.model.Comment;
import com.jk.service.CommentService;
import com.jk.util.ResultPage;
import com.jk.util.UserBeanUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("comment")
public class CommentController {

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

}
