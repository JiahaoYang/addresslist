package qsh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import qsh.entity.User;
import qsh.entity.Words;
import qsh.service.WordsService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class WordsController {

    @Autowired
    private WordsService wordsService;


    @RequestMapping("listWords")
    public String listWords(int classId, Model model) {
        List<Words> words = wordsService.getByClass(classId);
        model.addAttribute("words", words);
        model.addAttribute("classId", classId);
        return "user/listWords";
    }

    @RequestMapping("listReplies")
    public String listReplies(int wordsId, Model model) {
        Words words = wordsService.getById(wordsId);
        model.addAttribute("w", words);
        return "user/listReplies";
    }

    @RequestMapping("addWordsPage")
    public String addWordsPage(int classId, Model model) {
        model.addAttribute("classId", classId);
        return "user/addWords";
    }

    @RequestMapping("addWords")
    public String addWords(Words words, HttpSession session, int classId) {
        User user = (User) session.getAttribute("user");
        words.setUserId(user.getUserId());
        words.setClassId(classId);
        wordsService.addWords(words);
        return "redirect:listWords?classId=" + classId;
    }

    @RequestMapping("deleteWords")
    public String deleteWords(int wordsId) {
        int classId = wordsService.getById(wordsId).getClassId();
        wordsService.deleteById(wordsId);
        return "redirect:listWords?classId=" + classId;
    }

}
