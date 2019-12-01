package cn.ved.ssmblog.dao;

import cn.ved.ssmblog.domain.Blog;

import java.util.List;

public interface BlogDao {
    //添加贴子
    public void addBlog(Blog blog);
    //根据板块id所有贴子
    public List<Blog> findAllBlogsBybid(int bid);
    //根据用户id查询其所有贴子
    public List<Blog> findBlogsByuid(int uid);
}
