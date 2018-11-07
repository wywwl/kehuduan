package com.jk.service;

import com.jk.model.Blog;
import com.jk.model.Code;

import java.util.HashMap;

public interface CodeService {

    HashMap<String, Object> queryCode(Integer pageSize, Integer start);

    void deleteCode(Code code);

    HashMap<String, Object> queryBlog(Integer pageSize, Integer start);

    void deleteBlog(Blog blog);

    void updateall(Code code);

    void theshelves(Code code);
}
