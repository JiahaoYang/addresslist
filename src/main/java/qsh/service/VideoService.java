package qsh.service;

import org.springframework.stereotype.Service;
import qsh.dao.VideoDAO;
import qsh.entity.Video;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VideoService {

    @Resource
    private VideoDAO videoDAO;


    public int addvideo(Video video) {
        return videoDAO.addVideo(video);
    }

    public int deleteById(int videoId) {
        return videoDAO.deleteById(videoId);
    }

    public int updatevideo(Video video) {
        return videoDAO.updatevideo(video);
    }

    public List<Video> getByClass(int refClass) {
        return videoDAO.getByClass(refClass);
    }

    public int deleteByClass(int classId) {
        return videoDAO.deleteByClass(classId);
    }

}
