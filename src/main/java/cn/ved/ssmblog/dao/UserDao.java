package cn.ved.ssmblog.dao;

import cn.ved.ssmblog.domain.User;

/*
* 用户dao接口
* */
public interface UserDao {
    /*根据用户id查询用户*/
    public User findById(Integer id);
    /*根据user对象来添加用户*/
    public void addtUser(User user);
    //根据用户的邮箱来查询用户,注册时验证是否有重复注册()
    public User findByemail(String email);
    //根据用户名查询用户
    public User findByName(String username);
}
