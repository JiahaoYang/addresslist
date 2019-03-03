package qsh.service;

import org.springframework.stereotype.Service;
import qsh.dao.*;
import qsh.dto.ListByUserDTO;
import qsh.entity.Class;
import qsh.entity.Relation;
import qsh.entity.User;

import javax.annotation.Resource;
import java.util.*;

@Service
public class RelationService {

    @Resource
    private RelationDAO relationDAO;
    @Resource
    private UserDAO userDAO;

    @Resource
    private ClassService classService;

    public int addRelation(Relation relation) {
        return relationDAO.addRelation(relation);
    }

    public int deleteRelation(int relationId) {
        return relationDAO.deleteRelation(relationId);
    }

    public List<Relation> getByUser(int userId) {
        return relationDAO.getByUser(userId);
    }

    public List<Relation> getByClass(int classId) {
        return relationDAO.getByClass(classId);
    }

    /**
     * 列出当前用户加入的所有班级通讯录
     * 1. 获取当前用户加入班级的所有relations
     * 2. 遍历所有relations
     * 3. 获取class，获取该class所有用户，放入map
     * @return
     */
    public List<ListByUserDTO> listByUser(List<Relation> relations) {
        List<ListByUserDTO> result = new ArrayList<>();
        for (Relation relation: relations) {
            Class clazz = classService.getById(relation.getClassId());
            List<Relation> list = getByClass(clazz.getClassId());
            List<User> users = new ArrayList<>();
            for (Relation r: list) {
                User user = userDAO.getById(r.getUserId());
                users.add(user);
            }
            ListByUserDTO listByUserDTO = new ListByUserDTO();
            listByUserDTO.setClazz(clazz);
            listByUserDTO.setUsers(users);
            result.add(listByUserDTO);
        }
        return result;
    }
}
