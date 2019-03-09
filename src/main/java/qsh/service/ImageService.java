package qsh.service;

import org.springframework.stereotype.Service;
import qsh.dao.ImageDAO;
import qsh.entity.Image;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ImageService {

    @Resource
    private ImageDAO imageDAO;


    public int addImage(Image image) {
        return imageDAO.addImage(image);
    }

    public int deleteById(int imageId) {
        return imageDAO.deleteById(imageId);
    }

    public int updateImage(Image image) {
        return imageDAO.updateImage(image);
    }

    public List<Image> getByClass(int refClass) {
        return imageDAO.getByClass(refClass);
    }

    public int deleteByClass(int classId) {
        return imageDAO.deleteByClass(classId);
    }

}
