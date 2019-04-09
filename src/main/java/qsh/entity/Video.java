package qsh.entity;

import org.springframework.stereotype.Component;

@Component
public class Video {

    private Integer videoId;
    private String suffix;
    private Integer refClass;

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
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
