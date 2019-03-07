package qsh.dto;

import org.springframework.stereotype.Component;
import qsh.entity.Class;

@Component
public class JoinClassDTO {

    private Class clazz;
    private boolean join;
    private boolean apply;

    public Class getClazz() {
        return clazz;
    }

    public void setClazz(Class clazz) {
        this.clazz = clazz;
    }

    public boolean isJoin() {
        return join;
    }

    public void setJoin(boolean join) {
        this.join = join;
    }

    public boolean isApply() {
        return apply;
    }

    public void setApply(boolean apply) {
        this.apply = apply;
    }
}
