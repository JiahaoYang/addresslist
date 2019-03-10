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


    @RequestMapping("addSchoolPage")
    public String addSchoolPage() {
        return "admin/addSchool";
    }


    @RequestMapping("addSchool")
    public String addSchool(School school, HttpSession session) {
        User user = (User) session.getAttribute("user");
        school.setAdminId(user.getUserId());
        schoolService.addSchool(school);
        return "redirect:listSchools";
    }

    @RequestMapping("editSchoolPage")
    public String editSchoolPage(int schoolId, Model model) {
        School school = schoolService.getById(schoolId);
        model.addAttribute("school", school);
        return "admin/editSchool";
    }

    @RequestMapping("editSchool")
    public String editSchool(School school) {
        schoolService.updateById(school);
        return "redirect:listSchools";
    }

    @RequestMapping("checkSchoolName")
    @ResponseBody
    public String checkSchoolName(String schoolName) {
        boolean exist = schoolService.isExist(schoolName);
        if (exist)
            return "exist";
        return "";
    }

    @RequestMapping("checkSchoolName_")
    @ResponseBody
    public String checkSchoolName_(String schoolName, String oldName) {
        School school = schoolService.getByName(schoolName);
        if (school != null && !(school.getSchoolName().equals(oldName)))
            return "exist";
        return "";
    }

}
