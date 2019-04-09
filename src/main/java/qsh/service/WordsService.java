package qsh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qsh.dao.WordsDAO;
import qsh.entity.Words;

import javax.annotation.Resource;
import java.util.List;

@Service
public class WordsService {

    @Resource
    private WordsDAO wordsDAO;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private UserService userService;

    @Autowired
    private ClassService classService;

    public int addWords(Words words) {
        return wordsDAO.addWords(words);
    }

    public int deleteById(int wordsId) {
        replyService.deleteAll(wordsId);
        return wordsDAO.deleteById(wordsId);
    }

    public List<Words> getByClass(int classId) {
        List<Words> words = wordsDAO.getByClass(classId);
        for (Words w: words) {
            fillWords(w);
        }
        return words;
    }

    private void fillWords(Words words) {
        words.setUser(userService.getById(words.getUserId()));
        words.setClazz(classService.getById(words.getClassId()));
    }

    public Words getById(int wordsId) {
        Words words = wordsDAO.getById(wordsId);
        words.setUser(userService.getById(words.getUserId()));
        words.setReplys(replyService.getByWords(wordsId));
        words.setClazz(classService.getById(words.getClassId()));
        return words;
    }


}
