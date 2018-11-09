/** 
 * <pre>项目名称:ssm1 
 * 文件名称:SessionUserUtil.java 
 * 包名:com.jk.util 
 * 创建日期:2018年8月8日下午4:59:22 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.util.aop;

import com.jk.model.admin.Admins;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



/** 
 * <pre>项目名称：ssm1    
 * 类名称：SessionUserUtil    
 * 类描述：获取Session用户信息工具类    
 * 创建人：吴洋洋
 * 创建时间：2018年8月8日 下午4:59:22    
 * 修改人：   
 * 修改时间：2018年8月8日 下午4:59:22    
 * 修改备注：       
 * @version </pre>    
 */
public class SessionUserUtil {

	
	/**
	 * <pre>getUserInfn(获取Session用户Bean)   
	 * 创建人： 吴洋洋
	 * 创建时间：2018年8月8日 下午5:02:46    
	 * 修改人：      
	 * 修改时间：2018年8月8日 下午5:02:46    
	 * 修改备注： 
	 * @param request
	 * @return</pre>
	 */
	public static Admins getUserInfn(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Admins attribute = (Admins) session.getAttribute(session.getId());
		return attribute;
	}
	
	
	/**
	 * <pre>getUserInfn(获取Session用户Id)   
	 * 创建人： 吴洋洋
	 * 创建时间：2018年8月8日 下午5:02:46    
	 * 修改人：      
	 * 修改时间：2018年8月8日 下午5:02:46    
	 * 修改备注： 
	 * @param request
	 * @return</pre>
	 */
	public static Integer getUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Admins attribute = (Admins) session.getAttribute(session.getId());
		if(attribute != null) {
			return attribute.getAid();
		}
		return 0;
	}
	
	
	
	
	
}
