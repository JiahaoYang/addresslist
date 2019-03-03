package qsh.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import qsh.entity.Class;

@Mapper
public interface ClassDAO {

    @Select(" select * from class where class_id=#{classId} ")
    Class getById(int classId);


}
