package qsh.entity;

import org.springframework.stereotype.Component;

@Component
public class Image {

    private Integer imageId;
    private String suffix;
    private Integer refClass;

    public Integer getImageId() {
        return imageId;
    }

    public void setImageId(Integer imageId) {
        this.imageId = imageId;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public Integer getRefClass() {
        return refClass;
    }

    public void setRefClass(Integer refClass) {
        this.refClass = refClass;
    }
}
