package cn.ved.ssmblog.service;

import cn.ved.ssmblog.domain.Blog;
import cn.ved.ssmblog.domain.PageResult;

import java.util.List;

public interface BlogService {
    //添加贴子
    public void addBlog(Blog blog);

    //分页根据板块id所有贴子
    public PageResult<Blog> findAllBlogsBybid(int page ,int size,int bid);
    //分页 根据用户id查询所有贴子
    public PageResult<Blog> findAllBlogsByuid(int page ,int size,int uid);
}
