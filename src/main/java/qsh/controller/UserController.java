package qsh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;
import qsh.entity.User;
import qsh.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("loginPage")
    public String loginPage() {
        return "loginPage";
    }

    @RequestMapping("registerPage")
    public String registerPage() {
        return "registerPage";
    }


    @RequestMapping("/register")
    public String register(User user, Model model, HttpSession session) {
        int cnt = userService.addUser(user);
        return "loginPage";
    }

    @RequestMapping("/checkName")
    @ResponseBody
    public String checkName(String username) {
        boolean exist = userService.isExist(username);
        if (exist)
            return "exist";
        return "";
    }

    @RequestMapping("/checkName_")
    @ResponseBody
    public String checkName_(String username, String oldName) {
        User user = userService.getByName(username);
        if (user != null && !(user.getUsername().equals(oldName)))
            return "exist";
        return "";
    }


    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session, Model model) {
        username = HtmlUtils.htmlEscape(username);
        password = HtmlUtils.htmlEscape(password);
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            if (user.getUserType().equals("用户"))
                return "redirect:listByUser";
            else
                return "redirect:adminHome";
        }
        model.addAttribute("msg", "用户名或密码错误");
        return "loginPage";
    }


    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.setAttribute("user", null);
        return "redirect:loginPage";
    }

    @RequestMapping("user")
    public String editUserPage(int userId, Model model) {
        User user = userService.getById(userId);
        model.addAttribute("user", user);
        return "user/editUser";
    }

    @RequestMapping("editUser")
    public String editUser(User user, Model model, HttpSession session) {
        userService.updateUser(user);
        model.addAttribute("user", user);
        session.setAttribute("user", user);
        return "redirect:user?userId=" + user.getUserId();
    }

    @RequestMapping("settings")
    public String settings(int userId, Model model) {
        User user = userService.getById(userId);
        model.addAttribute("user", user);
        return "user/settings";
    }

    @RequestMapping("editPassword")
    public String editPassword(String password, String username) {
        userService.updatePassword(username, password);
        return "user/editUser";
    }

    @RequestMapping("checkPassword")
    @ResponseBody
    public String checkPassword(String username, String password) {
        User user = userService.login(username, password);
        if (user != null)
            return "";
        return "wrong";
    }

}
