package com.jk.model;

import java.io.Serializable;

/**
 * 王玉荣
 */
public class UserBean implements Serializable {

    private Integer id;
    private String name;
    private  Integer sex;
    private Integer age;
    private String login;
    private String upwd;
    private String address;
    private String uemial;
    private  String  file;
    private  String   grade;
    private   Integer  nbcount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUemial() {
        return uemial;
    }

    public void setUemial(String uemial) {
        this.uemial = uemial;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Integer getNbcount() {
        return nbcount;
    }

    public void setNbcount(Integer nbcount) {
        this.nbcount = nbcount;
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", login='" + login + '\'' +
                ", upwd='" + upwd + '\'' +
                ", address='" + address + '\'' +
                ", uemial='" + uemial + '\'' +
                ", file='" + file + '\'' +
                ", grade='" + grade + '\'' +
                ", nbcount=" + nbcount +
                '}';
    }
}
