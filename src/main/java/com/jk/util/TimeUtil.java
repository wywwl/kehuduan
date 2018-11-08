/** 
 * <pre>项目名称:maven-day1 
 * 文件名称:TimeUtil.java 
 * 包名:com.jk.utils 
 * 创建日期:2018年8月10日下午2:46:52 
 * Copyright (c) 2018, 634369607@qq.com All Rights Reserved.</pre> 
 */  
package com.jk.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/** 
 * <pre>项目名称：maven-day1    
 * 类名称：TimeUtil    
 * 类描述：获取时间戳
 * 创建人：马艳坤 
 * 创建时间：2018年8月10日 下午2:46:52    
 * 修改人：MK     
 * 修改时间：2018年8月10日 下午2:46:52    
 * 修改备注：       
 * @version </pre>    
 */
public class TimeUtil {

	public static String getTimestamp(Date date,String unix_timestamp) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(unix_timestamp);
		return simpleDateFormat.format(date);
	}
	
	public static String getTimestamp(Date date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYYmmddHHddss");
		return simpleDateFormat.format(date);
	}
}
