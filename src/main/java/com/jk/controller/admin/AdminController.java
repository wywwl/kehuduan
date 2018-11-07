package com.jk.controller.admin;



import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.fastjson.JSONArray;
import com.fasterxml.jackson.databind.JsonNode;
import com.jk.model.admin.*;
import com.jk.service.admin.AdminService;
import com.jk.util.admin.*;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.NameValuePair;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * 登录权限处理页面
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RedisTemplate redisTemplate;



    /**
     * 删除管理员用户
     * @return
     */
    @RequestMapping("deleteAdmin")
    @ResponseBody
    public String deleteAdmin(String ids){
        adminService.deleteAdmin(ids);
        return "{}";
    }

    /**
     * 新增管理员
     * @return
     */
    @RequestMapping("addAdminForm")
    @ResponseBody
    public String addAdminForm(String name,String login,String upwd,Integer age,Integer sex,String times,String emial){
        adminService.addAdminForm(name,login,upwd,age,sex,times,emial);
        return "{}";
    }


    /**
     * 弹框新增管理人员
     * @return
     */
    @RequestMapping("toaddAdmin")
    public String toaddAdmin(){
        return "/WEB-INF/adminJsp/addAdmin.jsp";
    }



    /**
     * 新增角色权限
     * @param rolesId
     * @param ids
     * @return
     */
    @RequestMapping("addRtree")
    @ResponseBody
    public String addRtree(String rolesId,String ids){
        adminService.addRtree(rolesId,ids);
        return "{}";
    }


    /**
     * 复选框树
     * @return
     */
    @RequestMapping("getbokTree")
    @ResponseBody
    public List<Trees> getbokTree(String roleId){
        List<Trees> trees = adminService.getbokTree(roleId);
        return trees;
    }


    /**
     * 弹框添加权限
     * @return
     */
    @RequestMapping("toRtree")
    public String toRtree(String rid,HttpServletRequest request){
        request.setAttribute("rid",rid);
        return "/WEB-INF/adminJsp/addRtree.jsp";
    }



    /**
     * 跳转角色绑定权限页面
     * @return
     */
    @RequestMapping("toRoleTree")
    public String toRoleTree(){
        return "/WEB-INF/adminJsp/roleTree.jsp";
    }


    /**
     * 用户添加角色方法
     * 吴洋洋
     * @return
     */
    @RequestMapping("addAdminRole")
    @ResponseBody
    public String addAdminRole(String ids,String adminId,HttpServletRequest request){
        HttpSession session = request.getSession();
        Admins attribute = (Admins) session.getAttribute(session.getId());
        Integer aid = attribute.getAid();
        adminService.addAdminRole(ids,adminId);
        redisTemplate.delete(Constant.TREE_CODE + aid);
        return "{}";
    }

    /**
     * 角色列表
     * 吴洋洋
     * @return
     */
    @RequestMapping("getRole")
    @ResponseBody
    public Map<String,Object> getRole(){
        Map<String, Object> map = new HashMap<>();
        List<Roles> role = adminService.getRole();
        map.put("rows",role);
        return map;
    }

    /**
     * 获取用户所拥有的获取角色id
     * @return
     */
    @RequestMapping("getRoleId")
    @ResponseBody
    public List<AdminRoles> getRoleId(String adminId){
        return adminService.getRoleId(adminId);
    }

    /**
     * 弹框添加用户角色
     * @return
     */
    @RequestMapping("toaddAdminRole")
    public String toaddAdminRole(String aid,HttpServletRequest request){
        request.setAttribute("aid",aid);
        return "/WEB-INF/adminJsp/addAdminRole.jsp";
    }



    /**
     * 用户列表
     * 吴洋洋
     * @return
     */
    @RequestMapping("getAdminAll")
    @ResponseBody
    public Map<String,Object> getAdminAll(int page,int rows){
        Map<String, Object> adminAll = adminService.getAdminAll(page, rows);
        return adminAll;
    }



    /**
     * 跳转用户附角色页面
     * 吴洋洋
     * @return
     */
    @RequestMapping("toAdminRole")
    public String toAdminRole(){
        return "/WEB-INF/adminJsp/adminRole.jsp";
    }

    /**
     * 左侧权限树
     * @return
     */
    @RequestMapping("getTree")
    @ResponseBody
    public List<Trees> getTree(HttpServletRequest request){
        HttpSession session = request.getSession();
        Admins attribute = (Admins) session.getAttribute(session.getId());
        Integer aid = attribute.getAid();
        //定义缓存key
        String cachekey = Constant.TREE_CODE+aid;
        //通过key获取当前用户的左侧权限树
        String treeCache = (String)redisTemplate.opsForValue().get(cachekey);
        //判断这个Key    treeCache是否存在  不存在就查询 存在直接返回
        if(treeCache == null){
            //查询当前登录的用户所有权限返回的List
            List<Trees> tree = adminService.getTree(aid);
            //将查询出来的权限树转换成json格式
            String json = JSONArray.toJSONString(tree);
            //将查询出的权限树存入缓存中
            redisTemplate.opsForValue().set(cachekey,json,30, TimeUnit.MINUTES);
            return tree;
        }
        List<Trees> trees = JSONArray.parseArray(treeCache, Trees.class);
        return trees;
    }


    /**
     * 跳转登陆成功后台主页
     * @return
     */
    @RequestMapping("toMain")
    public String toMain(){
        return "/WEB-INF/adminJsp/shoeMain.jsp";
    }

    /**
     * 登录
     * @return
     */
    @RequestMapping("login")
    @ResponseBody
    public Map<String,Object> login(Admins admins, String veriftyCode, HttpServletRequest request){
        Map<String, Object> result = new HashMap<String,Object>();
        HttpSession session = request.getSession();
        String code = (String) session.getAttribute("RANDOMVALIDATECODEKEY");

        if(!code.equals(veriftyCode)){
            result.put("msg",1);
            result.put("code","验证码错误");
            return result;
        }

        Admins adminsInfo = adminService.getUserByName(admins.getLogin());

        if(adminsInfo == null){
            result.put("msg",2);
            result.put("code","用户不存在");
            return result;
        }

        String password = admins.getUpwd();
        if(!password.equals(adminsInfo.getUpwd())){
            result.put("msg",3);
            result.put("code","密码错误");
            return result;
        }

        session.setAttribute(session.getId(), adminsInfo);
        result.put("msg",0);
        return result;
    }


    /**
     * 登陆页面
     * @return
     */
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "/WEB-INF/adminJsp/index.jsp";
    }


    /**
     * 验证码
     * @param request
     * @param response
     */
    @RequestMapping("getVerify")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            /*logger.error("获取验证码失败>>>>   ", e);*/
        }
    }





}
