package qsh.entity;

import org.springframework.stereotype.Component;

@Component
public class Message {

    private Integer messageId;
    private Integer fromUser;
    private Integer toUser;
    private Integer refClass;
    private String message;

    private String fromUsername;
    private String toUsername;
    private String refClassName;

    public String getFromUsername() {
        return fromUsername;
    }

    public void setFromUsername(String fromUsername) {
        this.fromUsername = fromUsername;
    }

    public String getToUsername() {
        return toUsername;
    }

    public void setToUsername(String toUsername) {
        this.toUsername = toUsername;
    }

    public String getRefClassName() {
        return refClassName;
    }

    public void setRefClassName(String refClassName) {
        this.refClassName = refClassName;
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getFromUser() {
        return fromUser;
    }

    public void setFromUser(Integer fromUser) {
        this.fromUser = fromUser;
    }


    public Integer getToUser() {
        return toUser;
    }

    public void setToUser(Integer toUser) {
        this.toUser = toUser;
    }

    public Integer getRefClass() {
        return refClass;
    }

    public void setRefClass(Integer refClass) {
        this.refClass = refClass;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
