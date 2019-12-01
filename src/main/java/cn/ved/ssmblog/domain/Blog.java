package cn.ved.ssmblog.domain;

import java.io.Serializable;
import java.sql.Time;

public class Blog implements Serializable {
    private static final long serialVersionUID = 930151620437834183L;
    //主键
    private Integer id;
    //发帖人id
    private Integer uid;
    //发帖时间
    private String jdate;
    //板块id
    private Integer bid;
    //正文内容
    private String profile;
    //上传的图片的地址
    private String imageurl;
    //贴子标题
    private String blogtitle;

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

    public String getJdate() {
        return jdate;
    }

    public void setJdate(String jdate) {
        this.jdate = jdate;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }

    public String getBlogtitle() {
        return blogtitle;
    }

    public void setBlogtitle(String blogtitle) {
        this.blogtitle = blogtitle;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id="  +id+
                ", uid=" + uid +
                ", jdate='" + jdate + '\'' +
                ", bid=" + bid +
                ", profile='" + profile + '\'' +
                ", imageurl='" + imageurl + '\'' +
                ", blogtitle='" + blogtitle + '\'' +
                '}';
    }
}
