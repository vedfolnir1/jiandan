package cn.ved.ssmblog.service.impl;

import cn.ved.ssmblog.dao.BlogDao;
import cn.ved.ssmblog.domain.Blog;
import cn.ved.ssmblog.domain.PageResult;
import cn.ved.ssmblog.service.BlogService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogDao blogDao;
    @Override
    public void addBlog(Blog blog) {
        blogDao.addBlog(blog);
    }


    @Override
    public PageResult<Blog> findAllBlogsBybid(int page, int size,int bid) {
        PageHelper.startPage(page, size);
        Page<Blog> allBlogs = (Page<Blog>) blogDao.findAllBlogsBybid(bid);
        return new PageResult<Blog>(allBlogs.getTotal(),allBlogs.getResult());
    }

    @Override
    public PageResult<Blog> findAllBlogsByuid(int page, int size, int uid) {
        PageHelper.startPage(page, size);
        Page<Blog> allBlogs= (Page<Blog>) blogDao.findBlogsByuid(uid);
        return new PageResult<Blog>(allBlogs.getTotal(),allBlogs.getResult());
    }
}
