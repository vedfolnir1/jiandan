package cn.ved.ssmblog.service.impl;

import cn.ved.ssmblog.dao.CommentDao;
import cn.ved.ssmblog.domain.Blog;
import cn.ved.ssmblog.domain.Comment;
import cn.ved.ssmblog.domain.PageResult;
import cn.ved.ssmblog.service.CommentService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;
    @Override
    public void addComment(Comment comment) {
        commentDao.addComment(comment);
    }

    @Override
    public PageResult<Comment> findCommBybgid(int bgid, int size, int page) {
        PageHelper.startPage(page, size);
        Page<Comment> pagecomment = (Page<Comment>) commentDao.findCommBybgid(bgid);
        return new PageResult<Comment>(pagecomment.getTotal(),pagecomment.getResult());
    }

    @Override
    public PageResult<Comment> findCommByuid(int uid, int size, int page) {
        PageHelper.startPage(page, size);
        Page<Comment> pagecomment = (Page<Comment>) commentDao.findCommByuid(uid);
        return new PageResult<Comment>(pagecomment.getTotal(),pagecomment.getResult());
    }

    @Override
    public PageResult<Comment> findCommByuname(String uname, int size, int page) {
        PageHelper.startPage(page, size);
        Page<Comment> pagecomment = (Page<Comment>) commentDao.findCommByuname(uname);
        return new PageResult<Comment>(pagecomment.getTotal(),pagecomment.getResult());
    }
}
