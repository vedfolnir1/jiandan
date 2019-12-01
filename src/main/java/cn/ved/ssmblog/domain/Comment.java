package cn.ved.ssmblog.domain;

import java.io.Serializable;

public class Comment implements Serializable {
    private static final long serialVersionUID = 4530774969324346435L;
    //主键
    private Integer id;
    //评论人id
    private Integer uid;
    //评论人姓名
    private String uname;
    //评论的帖子的id
    private Integer bgid;
    //评论内容
    private String ctext;
    //评论时间
    private String cdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Integer getBgid() {
        return bgid;
    }

    public void setBgid(Integer bgid) {
        this.bgid = bgid;
    }

    public String getCtext() {
        return ctext;
    }

    public void setCtext(String ctext) {
        this.ctext = ctext;
    }

    public String getCdate() {
        return cdate;
    }

    public void setCdate(String cdate) {
        this.cdate = cdate;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", uid=" + uid +
                ", uname='" + uname + '\'' +
                ", bgid=" + bgid +
                ", ctext='" + ctext + '\'' +
                ", cdate='" + cdate + '\'' +
                '}';
    }
}
