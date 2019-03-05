package qsh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import qsh.dto.ListByUserDTO;
import qsh.entity.Class;
import qsh.entity.*;
import qsh.service.*;
import qsh.util.Page;

import javax.servlet.http.HttpSession;
import java.util.List;

@SuppressWarnings("Duplicates")
@Controller
public class ClassController {

    @Autowired
    private ClassService classService;

    @Autowired
    private RelationService relationService;

    @Autowired
    private SchoolService schoolService;

    @RequestMapping("listByAdmin")
    public String listByAdmin(Model model, Page page, HttpSession session) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        User user = (User) session.getAttribute("user");
        List<Class> classes = classService.getByAdmin(user.getUserId());
        int total = (int) new PageInfo<>(classes).getTotal();
        page.setTotal(total);
        List<ListByUserDTO> list = relationService.listByAdmin(classes);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        return "user/listByAdmin";
    }

    @RequestMapping("editClassPage")
    public String editClassPage(int classId, Model model) {
        Class clazz = classService.getById(classId);
        School school = schoolService.getById(clazz.getSchoolId());
        clazz.setSchool(school);
        model.addAttribute("clazz", clazz);
        return "user/editClass";
    }

    @RequestMapping("editClass")
    public String editClass(Class clazz, Model model) {
        classService.updateClass(clazz);
        model.addAttribute("clazz", clazz);
        return "user/editClass";
    }

    @RequestMapping("deleteClass")
    public String deleteClass(int classId) {
        classService.deleteById(classId);
        return "redirect:listByAdmin";
    }

    @RequestMapping("addClassPage")
    public String addClassPage(Model model) {
        List<School> schools = schoolService.list();
        model.addAttribute("schools", schools);
        return "user/addClass";
    }

    @Transactional
    @RequestMapping("addClass")
    public String addClass(Class clazz, HttpSession session) {
        User user = (User) session.getAttribute("user");
        clazz.setAdminId(user.getUserId());
        classService.addClass(clazz);
        Relation relation = new Relation();
        relation.setUserId(user.getUserId());
        relation.setClassId(clazz.getClassId());
        relationService.addRelation(relation);
        return "redirect:listByAdmin";
    }

}
