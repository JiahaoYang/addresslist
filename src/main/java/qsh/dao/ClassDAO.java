package qsh.dao;

import org.apache.ibatis.annotations.*;
import qsh.entity.Class;

import java.util.List;

@Mapper
public interface ClassDAO {

    @Select(" select * from class where class_id=#{classId} ")
    Class getById(int classId);

    @Select(" select * from class where admin_id=#{adminId} ")
    List<Class> getByAdmin(int adminId);

    @Delete(" delete from class where class_id=#{classId} ")
    int deleteById(int classId);

    int addClass(Class clazz);

    int updateClass(Class clazz);
}
