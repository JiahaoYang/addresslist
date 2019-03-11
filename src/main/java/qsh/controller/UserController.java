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


    /**
     * 登录页面
     * @return
     */
    @RequestMapping("loginPage")
    public String loginPage() {
        return "loginPage";
    }

    /**
     * 注册页面
     * @return
     */
    @RequestMapping("registerPage")
    public String registerPage() {
        return "registerPage";
    }


    /**
     * 注册，创建新用户
     * @param user
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/register")
    public String register(User user, Model model, HttpSession session) {
        userService.addUser(user);
        return "loginPage";
    }

    /**
     * 创建用户时用户名查重，已存在该用户名返回exist
     * @param username
     * @return
     */
    @RequestMapping("/checkName")
    @ResponseBody
    public String checkName(String username) {
        boolean exist = userService.isExist(username);
        if (exist)
            return "exist";
        return "";
    }

    /**
     * 修改用户信息时用户名查重，如果新修改的用户名已存在且不为原用户名，返回exist
     * @param username
     * @param oldName
     * @return
     */
    @RequestMapping("/checkName_")
    @ResponseBody
    public String checkName_(String username, String oldName) {
        User user = userService.getByName(username);
        if (user != null && !(user.getUsername().equals(oldName)))
            return "exist";
        return "";
    }


    /**
     * 登录，在session中保存用户信息，并根据用户类型返回不同的前端页面
     * @param username
     * @param password
     * @param session
     * @param model
     * @return
     */
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
                return "redirect:listSchools";
        }
        model.addAttribute("msg", "用户名或密码错误");
        return "loginPage";
    }

    /**
     * 退出，删除session中用户信息
     * @param session
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.setAttribute("user", null);
        return "redirect:loginPage";
    }

    /**
     * 修改用户信息页面，先根据id获取用户信息填充到前端页面
     * @param userId
     * @param model
     * @return
     */
    @RequestMapping("user")
    public String editUserPage(int userId, Model model) {
        User user = userService.getById(userId);
        model.addAttribute("user", user);
        return "user/editUser";
    }

    /**
     * 修改用户信息，重新放入session中
     * @param user
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("editUser")
    public String editUser(User user, Model model, HttpSession session) {
        userService.updateUser(user);
        model.addAttribute("user", user);
        session.setAttribute("user", user);
        return "redirect:user?userId=" + user.getUserId();
    }

    /**
     * 设置页面，仅修改密码功能
     * @param userId
     * @param model
     * @return
     */
    @RequestMapping("settings")
    public String settings(int userId, Model model) {
        User user = userService.getById(userId);
        model.addAttribute("user", user);
        return "user/settings";
    }

    /**
     * 修改密码
     * @param password
     * @param username
     * @return
     */
    @RequestMapping("editPassword")
    public String editPassword(String password, String username) {
        userService.updatePassword(username, password);
        return "user/editUser";
    }

    /**
     * 检查原密码是否正确
     * @param username
     * @param password
     * @return
     */
    @RequestMapping("checkPassword")
    @ResponseBody
    public String checkPassword(String username, String password) {
        User user = userService.login(username, password);
        if (user != null)
            return "";
        return "wrong";
    }



}
