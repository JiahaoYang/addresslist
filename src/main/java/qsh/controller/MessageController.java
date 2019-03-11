package qsh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import qsh.entity.*;
import qsh.service.MessageService;
import qsh.service.RelationService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;
    @Autowired
    private RelationService relationService;


    /**
     * 想班级管理员发送申请加入的信息
     * @param session
     * @param toUser
     * @param refClass
     * @return
     */
    @RequestMapping("apply")
    public String apply(HttpSession session, int toUser, int refClass) {
        Message message = new Message();
        User user = (User) session.getAttribute("user");
        message.setFromUser(user.getUserId());
        message.setToUser(toUser);
        message.setRefClass(refClass);
        message.setMessage("申请");
        messageService.addMessage(message);
        return "redirect:listClasses";
    }

    /**
     * 查看所有通知
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("message")
    public String message(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<Message> messages = messageService.getMine(user.getUserId());
        model.addAttribute("messages", messages);
        return "user/listMessages";
    }


    @RequestMapping("deleteMessage")
    public String deleteMessage(int messageId) {
        messageService.deleteById(messageId);
        return "redirect:message";
    }

    /**
     * 拒绝用户的加入请求，删除申请加入的加入信息
     * @param messageId
     * @return
     */
    @RequestMapping("reject")
    @Transactional
    public String reject(int messageId) {
        Message oldMessage = messageService.getById(messageId);
        messageService.deleteById(messageId);
        Message message = new Message();
        message.setFromUser(oldMessage.getToUser());
        message.setRefClass(oldMessage.getRefClass());
        message.setToUser(oldMessage.getFromUser());
        message.setMessage("拒绝");
        messageService.addMessage(message);
        return "redirect:message";
    }

    /**
     * 同意加入请求，删除加入信息，添加加入信息至relation表
     * @param messageId
     * @return
     */
    @RequestMapping("approve")
    @Transactional
    public String approve(int messageId) {
        Message oldMessage = messageService.getById(messageId);
        messageService.deleteById(messageId);
        Message message = new Message();
        message.setFromUser(oldMessage.getToUser());
        message.setRefClass(oldMessage.getRefClass());
        message.setToUser(oldMessage.getFromUser());
        message.setMessage("同意");
        messageService.addMessage(message);
        Relation relation = new Relation();
        relation.setClassId(oldMessage.getRefClass());
        relation.setUserId(oldMessage.getFromUser());
        relationService.addRelation(relation);
        return "redirect:message";
    }

}
