package cn.ved.ssmblog.controller;

import cn.ved.ssmblog.domain.Comment;
import cn.ved.ssmblog.domain.PageResult;
import cn.ved.ssmblog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    //根据帖子id查询评论
    @RequestMapping(value = "/findCommBybgid")
    @ResponseBody
    public PageResult<Comment> findCommBybgid(int bgid,int size,int page){
        return commentService.findCommBybgid(bgid, size, page);
    }
    @RequestMapping(value = "/addComment")
    @ResponseBody
    public Map addComment(@RequestBody Comment comment, HttpServletRequest request){
        Map<String,Object> map=new HashMap<String,Object>();
        try {
            commentService.addComment(comment);
        }catch (Exception e){
            e.printStackTrace();
            map.put("cmsg", "评论发表失败");
            return map;
        }
        map.put("cmsg", "评论发表成功");
        return map;
    }
    @RequestMapping(value = "/findCommByuid")
    @ResponseBody
    public PageResult<Comment> findCommByuid(int uid,int size,int page){
        return commentService.findCommByuid(uid, size, page);
    }

}

