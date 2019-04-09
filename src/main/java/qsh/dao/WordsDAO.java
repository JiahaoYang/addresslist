package qsh.dao;

import org.apache.ibatis.annotations.*;
import qsh.entity.Words;

import java.util.List;

@Mapper
public interface WordsDAO {

    @Insert(" insert into words(user_id, title, content, class_id) values(#{userId}, #{title}, #{content}, #{classId} )")
    int addWords(Words words);

    @Delete( " delete from words where words_id = #{wordsId} ")
    int deleteById(int wordsId);

    @Select(" select * from words where class_id=#{classId} order by leave_time desc")
    List<Words> getByClass(int classId);

    @Select( " select * from words where words_id=#{wordsId} ")
    Words getById(int wordsId);
}
