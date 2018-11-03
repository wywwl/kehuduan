package com.jk.service.admin;

import com.jk.model.AdminRoles;
import com.jk.model.Admins;
import com.jk.model.Roles;
import com.jk.model.Trees;

import java.util.List;
import java.util.Map;

public interface AdminService {


    Admins getUserByName(String login);


    List<Trees> getTree(Integer aid);

    Map<String, Object> getAdminAll(int page,int rows);

    List<AdminRoles> getRoleId(String adminId);

    List<Roles> getRole();

    void addAdminRole(String ids, String adminId);

    List<Trees> getbokTree(String roleId);

    void addRtree(String rolesId, String ids);

    void addAdminForm(String name,String login,String upwd,Integer age,Integer sex,String times,String emial);

    void deleteAdmin(String ids);
}
