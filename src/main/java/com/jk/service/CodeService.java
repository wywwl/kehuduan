package com.jk.service;

import com.jk.model.Blog;
import com.jk.model.Code;
import com.jk.model.Comment;
import com.jk.model.UserBean;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;

public interface CodeService {



    void deleteCode(Code code);

    HashMap<String, Object> queryBlog(Integer pageSize, Integer start);

    void deleteBlog(Blog blog);

    List<Code> qyerycode(Code code,String keyword_name,String tname,String ids);

    void updateall(Code code);

    void theshelves(Code code);

    List<Blog> qyeryblog(Blog blog);

    List<Code> qyerycodejsp(Code code);

    List<Blog> qyeryblogjsp(Blog blog);

    List<UserBean> qyeryznuser(UserBean userBean);

    String selectManage();


    List<UserBean> qyeryusercode(UserBean userBean);


    List<Code> queryuser(UserBean userBean);

    List<Blog> querybloguser(UserBean userBean);

    List<UserBean> userinfo(UserBean userBean);

    Integer querycodecount(UserBean userBean);

    Integer queryblogcount(UserBean userBean);

    Integer problemcount(UserBean userBean);

    List<Comment> querycommnet(Comment comment);

    String addblog(Blog blog);

    void addcode(Code  code);

    String updateHead(MultipartFile file, int i);

    HashMap<String, Object> queryCode(Integer pageSize, Integer start);
}
