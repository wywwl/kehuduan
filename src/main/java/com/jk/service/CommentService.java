package com.jk.service;

import com.jk.model.Admins;
import com.jk.model.Blog;
import com.jk.model.Comment;
import com.jk.util.ResultPage;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface CommentService {

    /**
     * 查询评论
     */
    public List<Comment> queryComment(String bid );

    /**
     * f发送评论
     * @param comment
     */
    public void saveComment(Comment comment);

    /**
     *dian  zan
     * @param id
     */
   public  void addPraise(Integer id);

    List<Comment> getCommentByPage(Comment comment);

    void dels(String ids);

    void del(String id);

   ResultPage queryAdminComment(Comment comment);

    void addContent(/*HttpServletRequest request,*/ Comment comment, Admins admins);

    List<Blog> getBlogData(Blog blog);

}
