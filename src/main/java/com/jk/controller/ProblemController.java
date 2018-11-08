package com.jk.controller;

import com.jk.model.Problem;
import com.jk.model.UserBean;
import org.apache.catalina.User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jk.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("problem")
public class ProblemController {

    @Autowired
    private ProblemService problemService;


    //查询集合
    @RequestMapping("queryProblem")
    public String queryProblem(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        UserBean user = (UserBean)session.getAttribute("");
        Map<String, Object> json = new HashMap<String, Object>();
       Integer id = 1;
        List<Problem> list = problemService.queryProblem(id);
        for (Problem problem : list
        ) {
            problem.setNewDate(new Date());
        }
            model.addAttribute("problem", list);
            return "/ssm.jsp";
        }
        //搜索
        @RequestMapping("queryLicke")
        @ResponseBody
        public List<Problem> queryLicke(Problem problem){
           List<Problem> list = problemService.queryLicke(problem);

        return list;
    }
    //退出登录
    @RequestMapping("user")
    public void removeAll(HttpServletRequest request){

        request.getSession().getAttribute("userInfo");

        request.removeAttribute("userInfo");

    }
}

