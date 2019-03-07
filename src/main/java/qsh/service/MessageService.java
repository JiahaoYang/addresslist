package qsh.service;

import org.springframework.stereotype.Service;
import qsh.dao.*;
import qsh.entity.Message;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MessageService {

    @Resource
    private MessageDAO messageDAO;
    @Resource
    private UserDAO userDAO;
    @Resource
    private ClassDAO classDAO;


    public int addMessage(Message message) {
        return messageDAO.addMessage(message);
    }

    public List<Message> getMine(int toUser) {
        List<Message> messages = messageDAO.getMine(toUser);
        for (Message message: messages) {
            message.setFromUsername(userDAO.getById(message.getFromUser()).getUsername());
            message.setToUsername(userDAO.getById(message.getToUser()).getUsername());
            message.setRefClassName(classDAO.getById(message.getRefClass()).getClassName());
        }
        return messages;
    }

    public int deleteById(int messageId) {
        return messageDAO.deleteById(messageId);
    }

    public boolean isApply(int fromUser, int refClass, String msg) {
        return messageDAO.judgeIn(fromUser, refClass, msg) != null;
    }

    public Message getById(int messageId) {
        return messageDAO.getById(messageId);
    }


}
