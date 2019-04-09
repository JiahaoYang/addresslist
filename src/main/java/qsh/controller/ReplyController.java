package qsh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import qsh.entity.Reply;
import qsh.entity.User;
import qsh.service.ReplyService;

import javax.servlet.http.HttpSession;

@Controller
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    @RequestMapping("reply")
    public String reply(int wordsId, HttpSession session,String content) {
        User user = (User) session.getAttribute("user");
        Reply reply = new Reply();
        reply.setUserId(user.getUserId());
        reply.setContent(content);
        reply.setWordsId(wordsId);
        replyService.addReply(reply);
        return "redirect:listReplies?wordsId=" + wordsId;
    }

    @RequestMapping("deleteReply")
    public String deleteReply(int replyId) {
        int wordId = replyService.getById(replyId).getWordsId();
        replyService.deleteById(replyId);
        return "redirect:listReplies?wordsId=" + wordId;
    }
}
