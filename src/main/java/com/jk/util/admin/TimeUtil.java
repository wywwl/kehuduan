/** 
 * <pre>项目名称:ssm1 
 * 文件名称:TimeUtil.java 
 * 包名:com.jk.util 
 * 创建日期:2018年8月10日下午4:03:34 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.util.admin;

import java.text.SimpleDateFormat;
import java.util.Date;

/** 
 * <pre>项目名称：ssm1    
 * 类名称：TimeUtil    
 * 类描述： 时间工具类  
 * 创建人：吴洋洋
 * 创建时间：2018年8月10日 下午4:03:34    
 * 修改人：   
 * 修改时间：2018年8月10日 下午4:03:34    
 * 修改备注：       
 * @version </pre>    
 */
public class TimeUtil {

	
	public static String format(Date date,String format) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		return simpleDateFormat.format(date);
	}
	
	public static String format(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		return simpleDateFormat.format(date);
	}
	
	
	
	
	
	
	
	
	
	
}
