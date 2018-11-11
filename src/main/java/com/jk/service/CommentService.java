package com.jk.service;

import com.jk.model.*;
import com.jk.util.ResultPage;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

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
   //用户注册
    void insert(UserBean user);

    UserBean findbyid(UserBean user);

    void updategroupbyuser(Integer id, int groupvip);

    Object isusername(String login);

    void updateuseronlinetime(UserBean user);

    int findnowcount(Jifen jifen);

    Map<String, Object> login(UserBean user );

    void insertss(Jifen jifen);

    void update(UserBean user);

    UserBean findbyuserid(Integer id);
    //心情展示
    List<Mood> getMoodList(Mood mood);

    Integer getCount();

    List<UserBean> findUserInfo(UserBean users);
 //统计每个季度的注册人数
 List<Map<String,Object>> findGroupWeekData();
   //发表评论
    void saveMood(Mood  mood);


    MimeMessage createSimpleMail(Session session, String email, String toString);

    PageBean<Jifen> findpage(Jifen jifen, PageBean<Jifen> page);

    List<Jifen> findpage(PageBean<Jifen> page);
}

