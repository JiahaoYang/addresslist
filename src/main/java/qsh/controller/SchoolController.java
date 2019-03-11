package qsh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import qsh.entity.School;
import qsh.entity.User;
import qsh.service.SchoolService;
import qsh.util.Page;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SchoolController {

    @Autowired
    private SchoolService schoolService;

    /**
     * 管理员，列出所有学校信息
     * @param model
     * @param page
     * @return
     */
    @RequestMapping("listSchools")
    public String listSchools(Model model, Page page) {
        page.setCount(10);
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<School> schools = schoolService.list();
        int total = (int) new PageInfo<>(schools).getTotal();
        page.setTotal(total);
        model.addAttribute("schools", schools);
        model.addAttribute("page", page);
        return "admin/listSchools";
    }

    /**
     * 创建学校页面
     * @return
     */
    @RequestMapping("addSchoolPage")
    public String addSchoolPage() {
        return "admin/addSchool";
    }


    /**
     * 创建学校
     * @param school
     * @param session
     * @return
     */
    @RequestMapping("addSchool")
    public String addSchool(School school, HttpSession session) {
        User user = (User) session.getAttribute("user");
        school.setAdminId(user.getUserId());
        schoolService.addSchool(school);
        return "redirect:listSchools";
    }

    /**
     * 修改学校信息页面，需要先获取学校信息填入页面
     * @param schoolId
     * @param model
     * @return
     */
    @RequestMapping("editSchoolPage")
    public String editSchoolPage(int schoolId, Model model) {
        School school = schoolService.getById(schoolId);
        model.addAttribute("school", school);
        return "admin/editSchool";
    }

    /**
     * 修改学校信息
     * @param school
     * @return
     */
    @RequestMapping("editSchool")
    public String editSchool(School school) {
        schoolService.updateById(school);
        return "redirect:listSchools";
    }

    /**
     * 创建学校时，检查学校名字，如果已存在，返回exist
     * @ResponseBody 返回值不做视图映射处理（正常返回的String会当做视图名字，拼接成前端页面的名字）
     * @param schoolName
     * @return
     */
    @RequestMapping("checkSchoolName")
    @ResponseBody
    public String checkSchoolName(String schoolName) {
        boolean exist = schoolService.isExist(schoolName);
        if (exist)
            return "exist";
        return "";
    }

    /**
     * 修改学校信息时，检查学校名字，如果该名字已存在且不为该学校修改前的名字，返回exist
     * @param schoolName
     * @param oldName
     * @return
     */
    @RequestMapping("checkSchoolName_")
    @ResponseBody
    public String checkSchoolName_(String schoolName, String oldName) {
        School school = schoolService.getByName(schoolName);
        if (school != null && !(school.getSchoolName().equals(oldName)))
            return "exist";
        return "";
    }

}
