package qsh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qsh.dao.ReplyDAO;
import qsh.entity.Reply;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReplyService {

    @Resource
    private ReplyDAO replyDAO;

    @Autowired
    private UserService userService;

    public int addReply(Reply reply) {
        return replyDAO.addReply(reply);
    }

    public int deleteById(int replyId) {
        return replyDAO.deleteById(replyId);
    }

    public List<Reply> getByWords(int wordsId) {
        List<Reply> replies = replyDAO.getByWords(wordsId);
        for (Reply reply: replies)
            fillReply(reply);
        return replies;
    }

    public int deleteAll(int wordsId) {
        return replyDAO.deleteAll(wordsId);
    }

    public Reply getById(int replyId) {
        return replyDAO.getById(replyId);
    }


    private void fillReply(Reply reply) {
        reply.setUser(userService.getById(reply.getUserId()));
    }
}
