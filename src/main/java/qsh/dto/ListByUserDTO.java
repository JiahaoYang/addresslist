package qsh.dto;

import org.springframework.stereotype.Component;
import qsh.entity.Class;
import qsh.entity.User;

import java.util.List;

@Component
public class ListByUserDTO {

    private Class clazz;
    private List<User> users;

    public Class getClazz() {
        return clazz;
    }

    public void setClazz(Class clazz) {
        this.clazz = clazz;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
