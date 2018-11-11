package com.jk.controller;

import com.jk.model.Jifen;
import com.jk.model.PageBean;
import com.jk.model.UserBean;
import com.jk.service.CommentService;
import com.jk.tool.PublicStatic;
import com.jk.util.CreateExcel;
import com.jk.util.FileUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.util.StringUtil;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

@Controller
@RequestMapping("common")
public class CommonController {

    @Autowired
     CommentService commentService;


    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    private static Logger log = Logger.getLogger(CommonController.class);

    //每五秒钟调用一次，更新在线时间
    @ResponseBody
    @RequestMapping("updateuseronlinetime")
    public void updateuseronlinetime(HttpServletRequest request) {
        UserBean user=(UserBean) request.getSession().getAttribute(PublicStatic.USER);
        if(user!=null){
            Map<Integer, Long> map= (Map<Integer, Long>)request.getSession().getServletContext().getAttribute("updateuseronlinetime");
            if(map==null){
                map=new HashMap<Integer, Long>();
            }
            long l=System.currentTimeMillis();
            if(map.get(user.getId())==null||(l-map.get(user.getId())>4*1000)){
                commentService.updateuseronlinetime(user);
                map.put(user.getId(), l);
                request.getSession().getServletContext().setAttribute("updateuseronlinetime", map);
            }
        }
    }


/**
 * 王坤   多线程导出数据
 */
    @RequestMapping("exportExcel")
   public void  exportExcel(UserBean user, HttpServletResponse response, HttpServletRequest request)throws InterruptedException, IOException {

        SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
        //每页条数
        int rows=20;
        //总页数
        int totalpage=0;
        //传参数
        //查询总条数
        Integer count = commentService.getCount();
        //计算总页数
        totalpage =  count%rows==0?count/rows:count/rows+1;
        System.out.println("总共"+totalpage+"页");
        //定义一个多线程
        ExecutorService cachedThreadPool = Executors.newCachedThreadPool();

        for (int i = 1; i <= totalpage; i++) {
            UserBean users= new UserBean();
            users.setPage((i-1)*rows);
            users.setRows(rows);
            cachedThreadPool.execute(new CreateExcel(commentService,sxssfWorkbook,users,i));
        }
        cachedThreadPool.shutdown();
        Boolean loop=true;

        while (loop){
            loop =!cachedThreadPool.awaitTermination(2, TimeUnit.SECONDS);

        }
        System.out.println(request.getRealPath("/"));
     String filePath=request.getRealPath("/")+new Date().getTime()+".xlsx";
        OutputStream out  =  new FileOutputStream(new File(filePath));
       sxssfWorkbook.write(out);
       out.flush();
       out.close();
       sxssfWorkbook.dispose();
        FileUtil.downloadFile(request, response, filePath, "官网用户信息表.xlsx");
       new File(filePath).delete();

    }


    /**
     *
     * 报表    当年每个季度的注册人数
     * SELECT COUNT(*) FROM t_user WHERE MONTH(date_format(CreateTime,'%Y%m%d')) = MONTH(CURDATE()) AND WEEK(date_format(CreateTime,'%Y%m%d')) = WEEK(CURDATE())
     */


      @RequestMapping("getGroupQuarterData")
      @ResponseBody
     public List<Map<String,Object>> getGroupQuarterData(){
          List<Map<String,Object>> groupWeekData = commentService.findGroupWeekData();
          System.out.println(groupWeekData);
          return  groupWeekData;
      }



    @RequestMapping("verifyEmail")
    @ResponseBody
    public String verifyEmail(@RequestParam("email") String email){
        Properties prop = new Properties();
        // 开启debug调试，以便在控制台查看
        prop.setProperty("mail.debug", "tru  /**\n" +
                "     * qq邮箱\n" +
                "     * @param email\n" +
                "     * @return\n" +
                "     */\ne");
        // 设置邮件服务器主机名
        prop.setProperty("mail.host", "smtp.qq.com");
        // 发送服务器需要身份验证
        prop.setProperty("mail.smtp.auth", "true");
        // 发送邮件协议名称
        prop.setProperty("mail.transport.protocol", "smtp");

        prop.put("mail.smtp.ssl.enable", "true");

        // 创建session
        Session session  = Session.getInstance(prop);
        // 通过session得到transport对象
        Transport ts = null;
        try {
            ts = session.getTransport();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        }
        // 连接邮件服务器：邮箱类型，帐号(12345678)换成发送人的QQ，授权码：hpifogzyvixdbfbh，这是我的，你要换成你自己的

        try {
            ts.connect("smtp.qq.com", "2237218967", "bizkgeotfhsrdijg");// 后面的字符是授权码
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        //随机生成四位数字
        String str="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder stringBuilder=new StringBuilder(4);
        for(int i=0;i<4;i++)
        {
            char ch=str.charAt(new Random().nextInt(str.length()));
            stringBuilder.append(ch);
        }
        MimeMessage message=null;
        // 创建邮件
        try {

            message=createSimpleMail(session,email,stringBuilder.toString());
            System.out.println(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 发送邮件
        try {
            ts.sendMessage(message, message.getAllRecipients());
            session.setDebug(true);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        try {
            ts.close();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        String cunt=stringBuilder.toString();
        redisTemplate.opsForValue().set("email",cunt.toString());
        Boolean email1 = redisTemplate.expire("email", 60, TimeUnit.SECONDS);
        System.out.println(email);
        return cunt;
    }


    public MimeMessage createSimpleMail(Session  session, String email, String toString) throws Exception{
        // 创建邮件对象
        MimeMessage message = new MimeMessage(session);
        // 指明邮件的发件人...........3518693192@qq.com
        message.setFrom(new InternetAddress("2237218967@qq.com"));
        // 指明邮件的收件人
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
        // 邮件的标题
        message.setSubject("修改密码");
        // 邮件的文本内容
        message.setContent("修改密码的验证码(一分钟有效):"+toString+",请勿回复此邮箱", "text/html;charset=UTF-8");
        // 返回创建好的邮件对象
        return message;

    }


    //验证验证码
    @ResponseBody
    @RequestMapping("isemail")
    public String isyanzhengma(HttpServletRequest request,String email) {
        String flag="";
        UserBean users=(UserBean)request.getSession().getAttribute(PublicStatic.USER);
        String emails = redisTemplate.opsForValue().get("email");
        if(users.getUemial()!=null&&email!=users.getUemial()){
            if(emails!=null&&email!=""){
                String s = verifyEmail(email);
                if(s.equals(emails)){

                    return "success";
                }

            }else {
                return "error";
            }

        } else{

            return "noInfo";
        }



        return flag;
    }



    @RequestMapping("getUserEmail")
    @ResponseBody
    String SelectUserEmail(HttpServletRequest request){
        UserBean users=(UserBean)request.getSession().getAttribute(PublicStatic.USER);
        if(StringUtils.isNotBlank(users.getUemial())) {
             return users.getUemial();
        }
        return   null;
    }







    @RequestMapping("showUserJiFen")
    public String findAllWhere(HttpServletRequest request, Model model, Jifen jifen, PageBean<Jifen> page) {
        UserBean user=(UserBean)request.getSession().getAttribute(PublicStatic.USER);
        if(user.getId()!=null&&user.getId()!=0){
            jifen.setUserid(user.getId());
            page = commentService.findpage(jifen, page);
            model.addAttribute("page", page);
            model.addAttribute("jifen", jifen);

            user = commentService.findbyid(user);
            request.getSession().setAttribute(PublicStatic.USER,user);
        }else{
            return null;
        }

        return "/WEB-INF/user/user-jifen.jsp";
    }

    @RequestMapping("coinNb")
    @ResponseBody
      public String coinNb(HttpServletRequest request,Integer jifen){
        UserBean user=(UserBean)request.getSession().getAttribute(PublicStatic.USER);



       return "";
    }




}
