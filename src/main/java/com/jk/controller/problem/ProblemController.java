package com.jk.controller.problem;


import com.jk.model.problem.Problem;
import com.jk.model.problem.UserBean;
import com.jk.service.problem.ProblemService;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
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
        UserBean user = (UserBean)session.getAttribute("userInfo");
        Map<String, Object> json = new HashMap<String, Object>();
        Integer id = user.getId();
        List<Problem> list = problemService.queryProblem(id);
        for (Problem problem : list
        ) {
            File file = new File("");
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
        //取出对象:
        request.getSession().getAttribute("userInfo");
        //退出登录
        request.removeAttribute("userInfo");
    }
    //去首页
    @RequestMapping("toMain")
    public String toMain(){
        return "/home.jsp";
    }
    //分页查询:

    //添加问题选项
    @RequestMapping("addProblem")
    @ResponseBody
    public String addProblem(Problem problem){
        try {
            problemService.problemService();
        }catch (Exception e){
          e.printStackTrace();
        }
        return "1";
    }
}

