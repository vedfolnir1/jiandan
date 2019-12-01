package cn.ved.ssmblog.dao;

import cn.ved.ssmblog.domain.Comment;

import java.util.List;

public interface CommentDao {
    //添加评论
    public void addComment(Comment comment);
    //根据帖子id查询评论
    public List<Comment> findCommBybgid(int bgid);
    //根据评论人id来查询
    public List<Comment> findCommByuid(int uid);
    //根据评论人的姓名查询
    public List<Comment> findCommByuname(String uname);
}
