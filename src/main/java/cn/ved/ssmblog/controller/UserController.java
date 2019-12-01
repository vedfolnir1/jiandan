package cn.ved.ssmblog.controller;

import cn.ved.ssmblog.domain.User;
import cn.ved.ssmblog.service.UserService;
import cn.ved.ssmblog.utils.CryptographyUtil;
import cn.ved.ssmblog.utils.VeridyCode;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/*用户的controller类*/
@Controller
@RequestMapping(value = "/userManager")
public class UserController {
    @Autowired
    private UserService userService;
    /*注册页面*/
    @RequestMapping(value = "/register")
    public String register(@RequestParam("veridycode") String veridycode, User user, HttpServletResponse response, HttpServletRequest request) {
        //获取session域中的验证码值，并与输入进行验证
        String sessionveridycode = (String) request.getSession().getAttribute("veridycode");
        if (!sessionveridycode.equalsIgnoreCase(veridycode)){
            request.setAttribute("registermsg", "验证码错误");
            return "register";
        }
        /*先查询该邮箱是否被注册*/
        String email=user.getEmail();
        User userByemail = userService.findUserByemail(email);
        if (userByemail!=null){
            //如果被注册，返回并且添加错误信息
           request.setAttribute("registermsg", "该邮箱已经被注册");
            return "register";
        }
        //再查询是否用户名被注册
        User userByName = userService.findUserByName(user.getUsername());
        if (userByName!=null){
            //如果被注册，返回并且添加错误信息
            request.setAttribute("registermsg", "该用户名已经被注册");
            return "register";
        }
        //md5加密密码
        user.setPassword(CryptographyUtil.doMd5(user.getPassword(), "jiandan"));
        //注册用户
        userService.addUser(user);
        //将该用户注入域中
        request.setAttribute("currentuser", user);
        return "index";
    }
    @RequestMapping(value = "/login")
    public String login(User user,HttpServletRequest request){
        String username = user.getUsername();
        String password = user.getPassword();
        String email = user.getEmail();
        //先将用户名和密码作为token
        UsernamePasswordToken token=new UsernamePasswordToken(username, password);
        //若不存在用户名，则将邮箱作为token
        if (username==null||username.equals("")){
            token.setUsername(email);
        }
        Subject subject = SecurityUtils.getSubject();
        //进行验证
        try {
            subject.login(token);
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("loginmsg", "用户名或密码错误");
            return "login";
        }
        return "index";
    }
    //登出
    @RequestMapping(value = "/logout")
    public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        response.sendRedirect("/ssmjian/index.jsp");
    }
    //验证码servlet
    @RequestMapping(value = "/veridyCode")
    public void veridyCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
        VeridyCode veridyCode = new VeridyCode();
        BufferedImage image = veridyCode.getImage();
        String veridyCodeText = veridyCode.getText();
        request.getSession().setAttribute("veridycode", veridyCodeText);
        VeridyCode.output(image, response.getOutputStream());
    }
}
