package qsh.service;

import org.springframework.stereotype.Service;
import qsh.dao.*;
import qsh.entity.Class;
import qsh.entity.*;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClassService {

    @Resource
    private ClassDAO classDAO;

    @Resource
    private UserDAO userDAO;

    @Resource
    private SchoolDAO schoolDAO;

    @Resource
    private RelationDAO relationDAO;

    public Class getById(int classId) {
        Class clazz = classDAO.getById(classId);
        setAdminSchool(clazz);
        return clazz;
    }

    public List<Class> getByAdmin(int adminId) {
        return classDAO.getByAdmin(adminId);
    }


    /**
     * 新建班级，默认本人加入
     * @param clazz
     * @return
     */
    public int addClass(Class clazz) {
        return classDAO.addClass(clazz);
    }

    public int updateClass(Class clazz) {
        return classDAO.updateClass(clazz);
    }

    /**
     * 删除班级，同时删除所有加入班级的关系
     * @param classId
     * @return
     */
    public int deleteById(int classId) {
        relationDAO.deleteByClass(classId);
        return classDAO.deleteById(classId);
    }

    public List<Class> list() {
        List<Class> classes = classDAO.list();
        for (Class clazz: classes) {
            setAdminSchool(clazz);
        }
        return  classes;
    }

    private void setAdminSchool(Class clazz) {
        User user = userDAO.getById(clazz.getAdminId());
        School school = schoolDAO.getById(clazz.getSchoolId());
        clazz.setAdmin(user);
        clazz.setSchool(school);
    }

}
