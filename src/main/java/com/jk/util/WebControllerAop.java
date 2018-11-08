package com.jk.util;


import com.alibaba.fastjson.JSON;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;


@Aspect
@Component
public class WebControllerAop {

    /**
     * 切面到service
     */                 //↓↓↓↓下此表达式是定义在service包或者子包里的任意方法
    @Pointcut("execution(* com.jk.controller..*.*(..))")
    public void webLog(){}


    /**
     * 切点到controller的方法
     */                  //↓↓↓↓下此表达式是定义在service包或者子包里的任意方法
//    @Pointcut("execution(* com.wyy.controller..*.*(..))")
//    public void executeService(){}

    /**
     *  前置通知：方法调用前被调用
     */
//    @Before("webLog()")
//    public void doBeforeAdvice(JoinPoint joinPoint){//  通过JoinPoint 获取通知的签名信息，如目标方法名，目标方法参数信息等
//        System.out.println("我是前置通知");
//        Object[] obj=joinPoint.getArgs();//获取目标方法的参数信息
//        joinPoint.getThis(); // AOP代理类信息
//        joinPoint.getTarget(); // 代理的目标对象
//        Signature signature=joinPoint.getSignature(); //  用的最多，通知的签名
//        System.out.println("代理的方法是 ： "+signature.getName()); //  打印 代理的是哪一个方法
//        // AOP 代理的名字
//        System.out.println("AOP 代理的名字 ： "+signature.getDeclaringTypeName());
//        signature.getDeclaringType();//  AOP代理类的类（class）信息
//
//        /*
//          通过RequestContextHolder获取请求信息，如session 信息 ;
//         */
//        //  获取RequestAttributes
//        RequestAttributes requestAttributes= RequestContextHolder.getRequestAttributes();
//        //  从requestAttributes中获取HttpServletRequest信息
//        HttpServletRequest request=(HttpServletRequest)requestAttributes.resolveReference(RequestAttributes.REFERENCE_REQUEST);
//        //  获取session信息
//        HttpSession session=(HttpSession)requestAttributes.resolveReference(RequestAttributes.REFERENCE_SESSION);
//
//        System.out.println("请求 ： "+request+" ,  HttpSession : "+session);
//        Enumeration<String> enumerations=request.getParameterNames();
//       Map<String,String> parameterMaps=new HashMap<>();
//        while(enumerations.hasMoreElements()){
//            String parameter=enumerations.nextElement();
//            parameterMaps.put(parameter,request.getParameter(parameter));
//        }
//
//        String str= JSON.toJSONString(parameterMaps);//   alibaba.fastjson
//        if(obj.length>0){
//            System.out.println("请求参数信息为 ： "+ str );
//    }
//
//    }


    /**
     * 后置通知（目标方法只要执行完了就会执行后置通知方法）
     */
    @After("webLog()")
    public void doAfterService(JoinPoint joinPoint){
        System.out.println("后置最终通知执行了！");
        Object[] obj=joinPoint.getArgs();//获取目标方法的参数信息
        joinPoint.getThis(); // AOP代理类信息
        joinPoint.getTarget(); // 代理的目标对象
        Signature signature=joinPoint.getSignature(); //  用的最多，通知的签名
        System.out.println("代理的方法是 ： "+signature.getName()); //  打印 代理的是哪一个方法
        // AOP 代理的名字
        System.out.println("AOP 代理的名字 ： "+signature.getDeclaringTypeName());
        signature.getDeclaringType();//  AOP代理类的类（class）信息

        /*
          通过RequestContextHolder获取请求信息，如session 信息 ;
         */
        //  获取RequestAttributes
        RequestAttributes requestAttributes= RequestContextHolder.getRequestAttributes();
        //  从requestAttributes中获取HttpServletRequest信息
        HttpServletRequest request=(HttpServletRequest)requestAttributes.resolveReference(RequestAttributes.REFERENCE_REQUEST);
        //  获取session信息
        HttpSession session=(HttpSession)requestAttributes.resolveReference(RequestAttributes.REFERENCE_SESSION);

        System.out.println("请求 ： "+request+" ,  HttpSession : "+session);
        Enumeration<String> enumerations=request.getParameterNames();
        Map<String,String> parameterMaps=new HashMap<>();
        while(enumerations.hasMoreElements()){
            String parameter=enumerations.nextElement();
            parameterMaps.put(parameter,request.getParameter(parameter));
        }

        String str= JSON.toJSONString(parameterMaps);//   alibaba.fastjson
        if(obj.length>0){
            System.out.println("请求参数信息为 ： "+ str );
        }
    }
    /**
     * 环绕通知：
     *   环绕通知非常强大，可以决定目标方法是否执行，什么时候执行，执行时是否需要替换方法参数，执行完毕是否需要替换返回值。
     *   环绕通知第一个参数必须是org.aspectj.lang.ProceedingJoinPoint类型
     */
//    @Around("execution(* com.wyy.controller..*.*(..))")
//    public Object doAroundService(ProceedingJoinPoint proceedingJoinPoint){
//        System.out.println("环绕通知的目标方法名为 ： "+proceedingJoinPoint.getSignature().getName());
//        try {
//            Object object=proceedingJoinPoint.proceed();
//            return object;
//        } catch (Throwable throwable) {
//            throwable.printStackTrace();
//        }
//        return  null;
//    }



    /**
     *  后置异常通知
     *       定义一个名字，该名字用于匹配通知实现方法的一个参数名，当目标方法抛出异常返回后，将把目标方法抛出的异常传给通知方法；
     *  throwing 限定了只有目标方法抛出的异常与通知方法相应参数异常类型时才能执行后置异常通知，否则不执行，
     *      对于throwing对应的通知方法参数为Throwable类型将匹配任何异常。
     */
//    @AfterThrowing(value="webLog()",throwing = "exception")
//    public void doAfterThrowingAdvice(JoinPoint joinPoint,Throwable exception){
//        // 目标方法名
//        System.out.println(joinPoint.getSignature().getName());
//        if(exception instanceof NullPointerException){
//            System.out.println("异常通知");
//        }
//    }













}
