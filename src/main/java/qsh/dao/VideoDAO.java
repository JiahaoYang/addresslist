package qsh.dao;

import org.apache.ibatis.annotations.*;
import qsh.entity.Video;

import java.util.List;

@Mapper
public interface VideoDAO {


    int addVideo(Video video);

    @Delete(" delete from video where video_id=#{videoId} ")
    int deleteById(int videoId);

    @Update(" update video set suffix=#{suffix}, ref_class=#{refClass} where video_id=#{videoId} ")
    int updatevideo(Video video);

    @Select(" select * from video where ref_class=#{refClass} ")
    List<Video> getByClass(int refClass);

    @Delete(" delete from video where ref_class=#{classId} ")
    int deleteByClass(int classId);

}
