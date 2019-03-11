package qsh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import qsh.dto.ListByUserDTO;
import qsh.entity.Relation;
import qsh.entity.User;
import qsh.service.RelationService;
import qsh.util.Page;

import javax.servlet.http.HttpSession;
import java.util.List;

@SuppressWarnings("Duplicates")
@Controller
public class RelationController {

    @Autowired
    private RelationService relationService;


    /**
     * 我加入的班级
     * @param model
     * @param page
     * @param session
     * @return
     */
    @RequestMapping("listByUser")
    public String listByUser(Model model, Page page, HttpSession session) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        User user = (User) session.getAttribute("user");
        List<Relation> relations = relationService.getByUser(user.getUserId());
        int total = (int) new PageInfo<>(relations).getTotal();
        page.setTotal(total);
        List<ListByUserDTO> list = relationService.listByUser(relations);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        return "user/listByUser";
    }


}
