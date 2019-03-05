package qsh.dao;

import org.apache.ibatis.annotations.*;
import qsh.entity.Relation;

import java.util.List;

@Mapper
public interface RelationDAO {

    @Insert(" insert into relation(user_id, class_id) values(#{userId}, #{classId} )")
    @Options(useGeneratedKeys = true, keyProperty = "relationId")
    int addRelation(Relation relation);

    @Delete(" delete from relation where relation_id=#{relationId} ")
    int deleteRelation(int relationId);

    @Select(" select * from relation where user_id=#{userId} ")
    List<Relation> getByUser(int userId);

    @Select(" select * from relation where class_id=#{classId} ")
    List<Relation> getByClass(int classId);

    @Delete(" delete from relation where class_id=#{classId}")
    int deleteByClass(int classId);
}
