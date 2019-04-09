package qsh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import qsh.entity.User;
import qsh.entity.Video;
import qsh.service.ClassService;
import qsh.service.VideoService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class VideoController {

    @Autowired
    private VideoService videoService;
    @Autowired
    private ClassService classService;

    @RequestMapping("uploadVideo")
    @ResponseBody
    public String uploadVideo(Video video, HttpServletRequest request, int classId) {
        video.setSuffix("mp4");
        video.setRefClass(classId);
        videoService.addvideo(video);
        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> files = multiRequest.getFileMap();
        String uploadUrl = request.getSession().getServletContext().getRealPath("static/video/class/") + classId;
        for (MultipartFile file: files.values()) {
            String originalFileName = file.getOriginalFilename();
            String suffix = originalFileName.substring(originalFileName.lastIndexOf(".") + 1).toLowerCase();
            String targetFileName = video.getVideoId() + "." + suffix;
            File targetFile = new File(uploadUrl, targetFileName);
            targetFile.getParentFile().mkdirs();
            video.setSuffix(suffix);
            video.setRefClass(classId);
            videoService.updatevideo(video);
            try {
                targetFile.createNewFile();
                file.transferTo(targetFile);
            } catch (IOException e) {
                e.printStackTrace();
                return "上传失败";
            }
        }
        return "上传成功";
    }

    @RequestMapping("listVideos")
    public String listVideos(int classId, Model model, HttpSession session) {
        List<Video> videos = videoService.getByClass(classId);
        model.addAttribute("videos", videos);
        User user = (User) session.getAttribute("user");
        model.addAttribute("classId", classId);
        model.addAttribute("isAdmin", classService.getById(classId).getAdminId().equals(user.getUserId()));
        return "user/listVideos";
    }


    @RequestMapping("deleteVideo")
    public String deleteVideo(int videoId, int classId) {
        videoService.deleteById(videoId);
        return "redirect:listVideos?classId=" + classId;
    }
}
