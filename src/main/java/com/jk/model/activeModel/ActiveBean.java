package com.jk.model.activeModel;

import java.io.Serializable;
import java.util.Date;

/**
 * 王玉荣
 */
public class ActiveBean implements Serializable {

    private Integer hid;

    private Integer uid;

    private String content;

    private Date startdate;

    private Date enddate;

    private String browse;

    private String Fabulous;

    private String himg;

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public String getBrowse() {
        return browse;
    }

    public void setBrowse(String browse) {
        this.browse = browse;
    }

    public String getFabulous() {
        return Fabulous;
    }

    public void setFabulous(String fabulous) {
        Fabulous = fabulous;
    }

    public String getHimg() {
        return himg;
    }

    public void setHimg(String himg) {
        this.himg = himg;
    }
}