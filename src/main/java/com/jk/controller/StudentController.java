package com.jk.controller;


import com.jk.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("student")
public class StudentController {


    @RequestMapping("/toIndex")
    public String toIndex(){
        return "index";
    }


}