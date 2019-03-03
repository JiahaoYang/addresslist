package qsh.service;

import org.springframework.stereotype.Service;
import qsh.dao.*;
import qsh.entity.*;
import qsh.entity.Class;

import javax.annotation.Resource;

@Service
public class ClassService {

    @Resource
    private ClassDAO classDAO;

    @Resource
    private UserDAO userDAO;

    @Resource
    private SchoolDAO schoolDAO;

    public Class getById(int classId) {
        Class clazz = classDAO.getById(classId);
        User user = userDAO.getById(clazz.getAdminId());
        School school = schoolDAO.getById(clazz.getSchoolId());
        clazz.setAdmin(user);
        clazz.setSchool(school);
        return clazz;
    }
}
