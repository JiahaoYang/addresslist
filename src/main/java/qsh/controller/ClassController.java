package qsh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import qsh.dto.JoinClassDTO;
import qsh.dto.ListByUserDTO;
import qsh.entity.Class;
import qsh.entity.*;
import qsh.service.*;
import qsh.util.Page;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

    @Autowired
    private MessageService messageService;

    @Autowired
    private ImageService imageService;

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
    @Transactional
    public String deleteClass(int classId) {
        imageService.deleteByClass(classId);
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

    @RequestMapping("listClasses")
    public String listClasses(Model model, Page page, HttpSession session) {
        page.setCount(5);
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Class> classes = classService.list();
        int total = (int) new PageInfo<>(classes).getTotal();
        page.setTotal(total);
        User user = (User) session.getAttribute("user");
        List<JoinClassDTO> classDTOS = new ArrayList<>();
        for (Class clazz: classes) {
            JoinClassDTO joinClassDTO = new JoinClassDTO();
            joinClassDTO.setClazz(clazz);
            joinClassDTO.setJoin(relationService.judgeIn(user.getUserId(), clazz.getClassId()));
            joinClassDTO.setApply(messageService.isApply(user.getUserId(), clazz.getClassId(), "申请"));
            classDTOS.add(joinClassDTO);
        }
        model.addAttribute("classes", classDTOS);
        model.addAttribute("page", page);
        return "user/listClasses";
    }

    @RequestMapping("quitClass")
    @Transactional
    public String quitClass(HttpSession session, int classId) {
        User user = (User) session.getAttribute("user");
        relationService.delete(user.getUserId(), classId);
        Message message = new Message();
        message.setMessage("退出");
        message.setFromUser(user.getUserId());
        message.setToUser(classService.getById(classId).getAdminId());
        message.setRefClass(classId);
        messageService.addMessage(message);
        return "redirect:listByUser";
    }


}
