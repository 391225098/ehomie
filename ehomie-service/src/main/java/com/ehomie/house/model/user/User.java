package com.ehomie.house.model.user;

/**

 */
public class User {
    private int id;
    private String user_code;   //用户账号
    private String user_id;     //userid对应微信企业号user唯一标识
    private String user_name;   //用户名称
    private String passwd;
    private String tmp_code;

    public String getTmp_code() {
        return tmp_code;
    }

    public void setTmp_code(String tmp_code) {
        this.tmp_code = tmp_code;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_code() {
        return user_code;
    }

    public void setUser_code(String user_code) {
        this.user_code = user_code;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", user_code='" + user_code + '\'' +
                ", user_id='" + user_id + '\'' +
                ", user_name='" + user_name + '\'' +
                ", passwd='" + passwd + '\'' +
                '}';
    }
}
