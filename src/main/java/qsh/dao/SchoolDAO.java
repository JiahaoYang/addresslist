package qsh.dao;

import org.apache.ibatis.annotations.*;
import qsh.entity.School;

import java.util.List;

@Mapper
public interface SchoolDAO {

    @Select(" select * from school where school_id=#{schoolId} ")
    School getById(int schoolId);

    @Select(" select * from school ")
    List<School> list();

    int addSchool(School school);

    int updateById(School school);

    @Delete(" delete from school where school_id=#{schoolId} ")
    int deleteById(int schoolId);

    @Select(" select * from school where school_name=#{schoolName} ")
    School getByName(String schoolName);
}
