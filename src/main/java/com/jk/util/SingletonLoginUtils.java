package com.jk.util;

import com.alibaba.dubbo.common.utils.StringUtils;

import com.jk.model.UserBean;
import org.springframework.util.ObjectUtils;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;



/**
 * @author www.inxedu.com
 *
 */
public class SingletonLoginUtils {
	
	/**
	 * 
	 * 获取后台登录用户ID
	 * @param request
	 * @return 返因用户ID
	 */
	/*public static int getLoginSysUserId(HttpServletRequest request) {
		SysUser useObject = getLoginSysUser(request);
		if (ObjectUtils.isNotNull(useObject)) {
			return useObject.getUserId();
		} else {
			return 0;
		}
	}*/

	/**
	 * 获取后台登录用户
	 * @return SysUser
	 * @throws Exception
	 */
	/*public static SysUser getLoginSysUser(HttpServletRequest request) {
		String userKey = WebUtils.getCookie(request, CacheConstans.LOGIN_MEMCACHE_PREFIX);
		if (StringUtils.isNotEmpty(userKey)) {
			SysUser sysUser = (SysUser) EHCacheUtil.get(userKey);
			if (ObjectUtils.isNotNull(sysUser)) {
				return sysUser;
			}
		}
		return null;
	}*/
	
	/**
	 * 获取前台登录用户ID
	 * @param request
	 * @return 返回用户ID
	 */
	public static int getLoginUserId(HttpServletRequest request){
		UserBean user = getLoginUser(request);
		if(user!=null){
			return user.getId();
		}
		return 0;
	}
	
	/**
	 * 获取前台登录用户
	 * @param request
	 * @return User
	 */
	public static UserBean getLoginUser(HttpServletRequest request){
		UserBean userBean = (UserBean) request.getSession().getAttribute("userInfo");
		if(userBean!=null & !userBean.equals("")){
          return userBean;
		}
		return null;
	}



 

}
