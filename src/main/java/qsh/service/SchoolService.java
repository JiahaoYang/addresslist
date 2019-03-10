package qsh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qsh.dao.SchoolDAO;
import qsh.entity.School;
import qsh.entity.User;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SchoolService {

    @Resource
    private SchoolDAO schoolDAO;
    @Autowired
    private UserService userService;

    public School getById(int schoolId) {
        School school = schoolDAO.getById(schoolId);
        setAdmin(school);
        return school;
    }

    public List<School> list() {
        List<School> schools = schoolDAO.list();
        for (School school: schools)
            setAdmin(school);
        return schools;
    }

    public int addSchool(School school) {
        return schoolDAO.addSchool(school);
    }

    public int updateById(School school) {
        return schoolDAO.updateById(school);
    }

    public int deleteById(int schoolId) {
        return schoolDAO.deleteById(schoolId);
    }


    private void setAdmin(School school) {
        User admin = userService.getById(school.getAdminId());
        school.setAdmin(admin);
    }

    public boolean isExist(String schoolName) {
        return schoolDAO.getByName(schoolName) != null;
    }

    public School getByName(String schoolName) {
        return schoolDAO.getByName(schoolName);
    }
}
