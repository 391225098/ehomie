package com.ehomie.house.model.adminuser;


import com.ehomie.house.model.Pages;

import java.text.SimpleDateFormat;

public class AdminUser extends Pages {

    public final static int STATUS_ENABLE = 2;
    public final static int STATUS_DISABLE = 1;

    private int id;
    private String ids;
    private String username;
    private String realname;
    private String password;
    private int status;
    private String updater;
    private long updatetime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public long getUpdatetime() {
        return updatetime;
    }

    public String getFormatUpdatetime() {
        return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(updatetime);
    }

    public void setUpdatetime(long updatetime) {
        this.updatetime = updatetime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
