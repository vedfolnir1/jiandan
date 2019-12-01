import cn.ved.ssmblog.dao.UserDao;
import cn.ved.ssmblog.domain.Blog;
import cn.ved.ssmblog.domain.Comment;
import cn.ved.ssmblog.domain.PageResult;
import cn.ved.ssmblog.domain.User;
import cn.ved.ssmblog.service.BlogService;
import cn.ved.ssmblog.service.CommentService;
import cn.ved.ssmblog.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Test {

    @org.junit.Test
    public void testAddUser(){
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:application-context.xml");
        UserDao userdao = context.getBean("userDao", UserDao.class);
        User user = new User();
        user.setUsername("lisi");
        user.setPassword("hcw123");
        userdao.addtUser(user);
    }
    @org.junit.Test
    public void testAddUserS(){
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:application-context.xml");
        UserService userService = context.getBean("userService", UserService.class);
        User user = new User();
        user.setUsername("lisi");
        user.setPassword("hcw123");
        userService.addUser(user);
    }
    @org.junit.Test
    public void testFindBlog(){
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:application-context.xml");
        CommentService commentService = context.getBean(CommentService.class);
        PageResult<Comment> commByuid = commentService.findCommByuid(2, 50, 1);
        System.out.println(commByuid);
    }


}
