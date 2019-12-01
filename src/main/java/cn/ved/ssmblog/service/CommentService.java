package cn.ved.ssmblog.service;

import cn.ved.ssmblog.domain.Blog;
import cn.ved.ssmblog.domain.Comment;
import cn.ved.ssmblog.domain.PageResult;

import java.util.List;

public interface CommentService {
    //添加评论
    public void addComment(Comment comment);
    //分页根据帖子id查询评论
    public PageResult<Comment> findCommBybgid(int bgid,int size, int page);
    //根据评论人id来查询
    public PageResult<Comment> findCommByuid(int uid,int size, int page);
    //根据评论人的姓名查询
    public PageResult<Comment> findCommByuname(String uname,int size, int page);

}
