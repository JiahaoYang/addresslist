package qsh.dao;

import org.apache.ibatis.annotations.*;
import qsh.entity.Image;

import java.util.List;

@Mapper
public interface ImageDAO {


    int addImage(Image image);

    @Delete(" delete from image where image_id=#{imageId} ")
    int deleteById(int imageId);

    @Update(" update image set suffix=#{suffix}, ref_class=#{refClass} where image_id=#{imageId} ")
    int updateImage(Image image);

    @Select(" select * from image where ref_class=#{refClass} ")
    List<Image> getByClass(int refClass);

    @Delete(" delete from image where ref_class=#{classId} ")
    int deleteByClass(int classId);

}
