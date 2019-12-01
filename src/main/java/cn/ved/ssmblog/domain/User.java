package cn.ved.ssmblog.domain;

import java.io.Serializable;
/*用户类*/
public class User implements Serializable {

    private static final long serialVersionUID = -4789705256491736094L;
    /*主键id，注入数据库时自动增长，不手动注入*/
    private Integer id;
    /*用户名 非空*/
    private String username;
    /*密码 非空*/
    private String password;
    /*邮箱 选填*/
    private String email;
    /*昵称 选填*/
    private String nickname;
    /*是否为管理员，1表示是，0代表不是*/
    private Integer isAdmin =0 ;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }


    public Integer getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Integer isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", isAdmin=" + isAdmin +
                '}';
    }
}
