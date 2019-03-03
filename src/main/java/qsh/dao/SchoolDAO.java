package qsh.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import qsh.entity.School;

@Mapper
public interface SchoolDAO {

    @Select(" select * from school where school_id=#{schoolId} ")
    School getById(int schoolId);
}
