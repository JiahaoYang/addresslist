package qsh.service;

import org.springframework.stereotype.Service;
import qsh.dao.SchoolDAO;
import qsh.entity.School;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SchoolService {

    @Resource
    private SchoolDAO schoolDAO;

    public School getById(int schoolId) {
        return schoolDAO.getById(schoolId);
    }

    public List<School> list() {
        return schoolDAO.list();
    }
}
