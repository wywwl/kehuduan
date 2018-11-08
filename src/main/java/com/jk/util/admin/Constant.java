/** 
 * <pre>项目名称:ssm1 
 * 文件名称:Constant.java 
 * 包名:com.jk 
 * 创建日期:2018年8月9日上午12:39:32 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.util.admin;

/** 
 * <pre>项目名称：ssm1    
 * 类名称：Constant    
 * 类描述：   常量类 
 * 创建人：吴洋洋
 * 创建时间：2018年8月9日 上午12:39:32    
 * 修改人：   
 * 修改时间：2018年8月9日 上午12:39:32    
 * 修改备注：       
 * @version </pre>    
 */
public class Constant {

	
	
	/*
	 *短信平台地址
	 * */
	public static final String SMS_URL = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	
	
	/*
	 *短信开发者主账号ID
	 * */
	public static final String ACCOUNTSID = "23bbbb63aa8c41b0aafa1c06384252a8";
	
	
	/*
	 *短信模板Id
	 * */
	public static final String TEMPLATEID = "899994657";
	
	/*
	 *签名
	 * */
	public static final String AUTH_TOKEN = "df07d7a98ba04dd09bd243cc275c965b";


	/*
	 *验证码缓存key
	 * */
	public static final String LOGIN_CODE = "loginCode";


	/*
	 *一分钟之内不能重复获取短信验证码标识符
	 * */
	public static final String LOGIN_CODE_FLAG = "loginCodeflag";

	/*
	 *权限树缓存Key
	 * */
	public static  final String TREE_CODE = "treeCode";

	
}
