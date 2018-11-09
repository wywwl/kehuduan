package com.jk.util.aop;


import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.fastjson.JSON;
import com.jk.model.admin.Roles;
import com.jk.model.aop.Logs;
import com.jk.model.aop.RoleLog;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;


@Aspect
@Component
public class WebControllerAop {

    @Autowired
    private MongoTemplate mongoTemplate;

    /**
     * 切面到service
     */                 //↓↓↓↓下此表达式是定义在service包或者子包里的任意方法
   @Pointcut("execution(* com.jk.service..*.*(..))")
    public void webLog(){}


    /**
     * 切点到service的方法
     */                  //↓↓↓↓下此表达式是定义在service包下的什么包下的什么方法
    @Pointcut("execution(* com.jk.service.admin.AdminService.getRole(..))")
    public void executeService(){}


    @AfterReturning(pointcut="executeService()",returning="object")
    public void doAfterReturning(Object object) {
        List<Roles> roles = (List<Roles>)object;
        for (int i=0;i<roles.size();i++){
            RoleLog roleLog = new RoleLog();
            roleLog.setId(roles.get(i).getRid().toString()+"2");
            roleLog.setUserId("1");
            roleLog.setRoless(roles.get(i).getRname());
            roleLog.setCreateTime(new Date());
            mongoTemplate.save(roleLog);
            System.out.println(roles.get(i).getRname());
        }



        System.out.println("后置通知:"+ object);
    }


    /**
     * 后置通知（实现足迹存储mongodb）
     */
//    @After("executeService()")
//    public void doFootprintService(ProceedingJoinPoint point){
//        try {
//            Object object = point.proceed();
//            System.out.println("返回值="+object);
//        } catch (Throwable throwable) {
//            throwable.printStackTrace();
//        }
//
//    }





    /**
     * 最终通知（实现日志记录存储mongodb）
     */
//    @After("webLog()")
//    public void doAfterService(JoinPoint joinPoint){
//        // 判断参数
//        if (joinPoint.getArgs() == null) {// 没有参数
//            return;
//        }
//        Logs logs = new Logs();
//        //获取方法请求参数
//        Object[] os = joinPoint.getArgs();
//        //获取类名
//        String className = joinPoint.getTarget().getClass().getSimpleName();
//        logs.setClassName(className);
//        //获取方法名
//        String methodName = joinPoint.getSignature().getName();
//        logs.setMethodName(methodName);
//        String param = className + "." + methodName + ":";
//        for (int i = 0; i < os.length; i++) {
//            param += "参数[" + i + "]:" + os[i].toString();
//        }
//        logs.setParam(param);
//        logs.setCreateTime(new Date());
//
//        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
//        ServletRequestAttributes sra = (ServletRequestAttributes) requestAttributes;
//
//        if(sra != null) {
//            HttpServletRequest request = sra.getRequest();
//            Integer userId = SessionUserUtil.getUserId(request);
//            logs.setUserId(userId.toString());
//            logs.setIp(getIp(request));
//        }
//        mongoTemplate.save(logs);
//        System.out.println("后置通知成功");
//    }
//
//    //获取客户端ip
//    public static String getIp(HttpServletRequest request) {
//        String ip = request.getHeader("X-Forwarded-For");
//        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
//            //多次反向代理后会有多个ip值，第一个ip才是真实ip
//            int index = ip.indexOf(",");
//            if(index != -1){
//                return ip.substring(0,index);
//            }else{
//                return ip;
//            }
//        }
//        ip = request.getHeader("X-Real-IP");
//        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
//            return ip;
//        }
//        return request.getRemoteAddr();
//    }






}
