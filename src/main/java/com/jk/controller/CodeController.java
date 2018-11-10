package com.jk.controller;

import com.jk.model.*;
import com.jk.service.CodeService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("CodeController")
public class CodeController {

    @Autowired
    private CodeService codeService;


    @RequestMapping("queryJsp")
    public String queryJsp(){

      return "/view/querycode.jsp";
    }

    /**
     *  代码模块后台系统：查询 ,分页
     *
     */
    @RequestMapping("queryCode")
    @ResponseBody
    public HashMap<String, Object> queryCode(Integer pageSize,Integer start){
        HashMap<String, Object> map=codeService.queryCode(pageSize,start);

        return map;

    }
      /*
      *    代码模块前台管理系统  跳转页面
      *
      * */

    @RequestMapping("qyerycode")
    public String qyerycode(Model model, Code code,String keyword_name,String tname,String ids){
        List<Code> list= codeService.qyerycode(code,keyword_name,tname,ids);
        model.addAttribute("list",list);
        return  "/view/code.jsp";
    }

    /*
     *   代码模块后台系统：删除
     *
     * */
    @RequestMapping("deleteCode")
    @ResponseBody
    public  void deleteCode(Code code){

        codeService.deleteCode(code);
    }

    /*
     *   代码模块后台系统：审核改变状态
     *
     * */
    @RequestMapping("updateall")
    @ResponseBody
    public  void updateall(Code  code){

        codeService.updateall(code);
    }


    /*
     *   代码模块后台系统：审核改变为未通过
     *
     * */
    @RequestMapping("theshelves")
    @ResponseBody
    public  void theshelves(Code  code){

        codeService.theshelves(code);
    }

    /*
     *   博客模块后台系统：查询
     *
     * */
    @RequestMapping("queryBlog")
    @ResponseBody
    public HashMap<String, Object> queryBlog( Integer pageSize,Integer start){
        HashMap<String, Object> map=codeService.queryBlog(pageSize,start);

        return map;

    }

    /*
     *   博客模块后台系统：：删除
     *
     * */
    @RequestMapping("deleteBlog")
    @ResponseBody
    public  void deleteBlog(Blog blog){

        codeService.deleteBlog(blog);
    }
    /*
     *   博客模块前台系统：：跳转
     *
     * */
    @RequestMapping("qyeryblog")
    public String qyeryblog(Model model, Blog blog, UserBean userBean, Comment comment){
        List<Blog> list= codeService.qyeryblog(blog);
        List<UserBean> userBeanlist= codeService.qyeryznuser(userBean);
        List<Comment>commentList=  codeService.querycommnet(comment);
        model.addAttribute("list",list);
        model.addAttribute("userBeanlist",userBeanlist);
        model.addAttribute("commentList",commentList);
        return  "/view/blog.jsp";
    }

    /*
     *   代码模块前台系统：点击标题查询该Id的数据
     *
     * */
    @RequestMapping("qyerycodejsp")
    public String qyerycodejsp(Model model,Code code,UserBean userBean){
        List<Code> list= codeService.qyerycodejsp(code);
        List<UserBean> userBeanList= codeService.qyeryusercode(userBean);
        model.addAttribute("list",list);
        model.addAttribute("userBeanList",userBeanList);
        return  "/view/qyerycodejsp.jsp";
    }
    /*
     *
     *   博客模块前台系统：点击标题查询该Id的数据
     * */
    @RequestMapping("qyeryblogjsp")
    public String qyeryblogjsp(Model model,Blog blog,Comment comment){
        List<Blog> list= codeService.qyeryblogjsp(blog);
        List<Comment>commentList=  codeService.querycommnet(comment);
        model.addAttribute("list",list);
        model.addAttribute("commentList",commentList);
        return  "/view/queryblogjsp.jsp";

    }

    /*
     *   前台二级类型
     * */
    @RequestMapping("selectManage")
    @ResponseBody
    public String selectManage(TypesBean typesBean){
        String list=codeService.selectManage();
        return list;
    }
    /*
     *    代码模块点击右侧用户信息  跳转个人空间
     *
     * */

    @RequestMapping("queryuser")
    public String queryuser(Model model,UserBean userBean){
        List<Code>list=  codeService.queryuser(userBean);
        List<UserBean>userBeanlist=  codeService.userinfo(userBean);
        Integer codecount =codeService.querycodecount(userBean);
        Integer blogcount =codeService.queryblogcount(userBean);
        Integer problemcount =codeService.problemcount(userBean);
        model.addAttribute("list",list);
        model.addAttribute("userBeanlist",userBeanlist);
        model.addAttribute("codecount",codecount);
        model.addAttribute("blogcount",blogcount);
        model.addAttribute("problemcount",problemcount);
        return "/view/userinformation.jsp";
    }

    /*
     * 点击等级图标跳转页面
     *
     * */

    @RequestMapping("querygrade")
    public String querygrade(){

        return "/view/grade.jsp";
    }

    @RequestMapping("addblog")
    public String addblog(Blog blog){

        codeService.addblog(blog);

        return "redirect:/CodeController/qyeryblog";

    }

    @RequestMapping("addcode")
    public String addcode(Code  code){

        codeService.addcode(code);

        return "redirect:/CodeController/qyerycode";

    }



}
