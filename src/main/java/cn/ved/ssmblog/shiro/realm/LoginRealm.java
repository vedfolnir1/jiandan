package cn.ved.ssmblog.shiro.realm;

import cn.ved.ssmblog.domain.User;
import cn.ved.ssmblog.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

/*
* 登录时的realm
* */
public class LoginRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }
    /*登录验证身份*/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String tokenUsername = token.getUsername();
        //根据邮箱查询用户
        User user = userService.findUserByemail(tokenUsername);
        if (user==null){
            user = userService.findUserByName(tokenUsername);
        }
        if (user==null){
            return null;
        }
        SecurityUtils.getSubject().getSession().setAttribute("currentuser", user);
        String username=user.getUsername();
        String password = user.getPassword();
        ByteSource salt = ByteSource.Util.bytes("jiandan");
        String thisname = getName();
        return new SimpleAuthenticationInfo(username, password, salt, thisname);
    }
}
