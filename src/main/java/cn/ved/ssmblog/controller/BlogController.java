package cn.ved.ssmblog.controller;

import cn.ved.ssmblog.domain.Blog;
import cn.ved.ssmblog.domain.PageResult;
import cn.ved.ssmblog.service.BlogService;
import com.sun.org.apache.xpath.internal.objects.XObject;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/blog")
public class BlogController {
    @Autowired
    private BlogService blogService;
    /*发表博客*/
    @RequestMapping(value = "/addblog",method = RequestMethod.POST)
    @RequiresAuthentication
    @ResponseBody
    public Map addblog(@RequestBody Blog blog, HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            blogService.addBlog(blog);
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", "发表失败");
            return map;
        }
        map.put("message", "成功");
        return map;
    }
    //根据板块id分页查询所有帖子
    @GetMapping(value = "/findAllBlogsBybid")
    @ResponseBody
    public PageResult<Blog> findAllBlogsBybid(int page,int size,int bid){
        return blogService.findAllBlogsBybid(page, size,bid);
    }
    @RequestMapping(value = "/findAllBlogsByuid")
    @ResponseBody
    public PageResult<Blog> findAllBlogsByuid(int page,int size,int uid){
        return blogService.findAllBlogsByuid(page, size,uid);
    }
}
