package cn.ved.ssmblog.service;

import cn.ved.ssmblog.domain.User;

/*用户服务接口*/
public interface UserService {
    /*注册用户的方法*/
    public void addUser(User user);
    //根据邮箱查询用户(邮箱唯一)
    public User findUserByemail(String email);
    //根据用户名查询用户（用户名唯一）
    public User findUserByName(String username);
}
