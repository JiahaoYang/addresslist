package qsh.entity;

import org.springframework.stereotype.Component;

@Component
public class Image {

    private Integer imageId;
    private String path;
    private Integer userId;

    public Integer getImageId() {
        return imageId;
    }

    public void setImageId(Integer imageId) {
        this.imageId = imageId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Image{" +
                "imageId=" + imageId +
                ", path='" + path + '\'' +
                ", userId=" + userId +
                '}';
    }
}
