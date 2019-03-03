package qsh.entity;

import org.springframework.stereotype.Component;

@Component
public class Relation {

    private Integer relationId;
    private Integer userId;
    private Integer classId;

    public Integer getRelationId() {
        return relationId;
    }

    public void setRelationId(Integer relationId) {
        this.relationId = relationId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "Relation{" +
                "relationId=" + relationId +
                ", userId=" + userId +
                ", classId=" + classId +
                '}';
    }
}
