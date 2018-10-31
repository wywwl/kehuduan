package com.jk.controller;


import com.jk.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("/jiekou")
    public void tojiekou() {
        studentService.hh();
        System.out.println("哈哈哈哈哈   看成功了吧");
    }

}