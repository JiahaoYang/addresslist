package qsh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import qsh.entity.Image;
import qsh.entity.User;
import qsh.service.ClassService;
import qsh.service.ImageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class ImageController {

    @Autowired
    private ImageService imageService;
    @Autowired
    private ClassService classService;

    /**
     * 班级管理人上传一张图片，图片保存在webapp/static/img/class/图片上传至哪个class的id/图片的imageId
     * @param image
     * @param request
     * @param classId
     * @return
     */
    @RequestMapping("upload")
    @ResponseBody
    public String upload(Image image, HttpServletRequest request, int classId) {
        image.setSuffix("jpg");
        imageService.addImage(image);
        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> files = multiRequest.getFileMap();
        String uploadUrl = request.getSession().getServletContext().getRealPath("static/img/class/") + classId;
        for (MultipartFile file: files.values()) {
            String originalFileName = file.getOriginalFilename();
            String suffix = originalFileName.substring(originalFileName.lastIndexOf(".") + 1).toLowerCase();
            String targetFileName = image.getImageId() + "." + suffix;
            File targetFile = new File(uploadUrl, targetFileName);
            targetFile.getParentFile().mkdirs();
            image.setSuffix(suffix);
            image.setRefClass(classId);
            imageService.updateImage(image);
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

    /**
     * 照片墙，列出所有班级图片，如果当前用户为班级管理员，可删除照片墙的图片
     * @param classId
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("listImages")
    public String listImages(int classId, Model model, HttpSession session) {
        List<Image> images = imageService.getByClass(classId);
        model.addAttribute("images", images);
        User user = (User) session.getAttribute("user");
        model.addAttribute("isAdmin", classService.getById(classId).getAdminId().equals(user.getUserId()));
        model.addAttribute("classId", classId);
        return "user/listImages";
    }

    /**
     * 删除图片
     * @param imageId
     * @param classId
     * @return
     */
    @RequestMapping("deleteImage")
    public String deleteImage(int imageId, int classId) {
        imageService.deleteById(imageId);
        return "redirect:listImages?classId=" + classId;
    }

}
