package qsh.dao;

import org.apache.ibatis.annotations.*;
import qsh.entity.Reply;

import java.util.List;

@Mapper
public interface ReplyDAO {

    @Insert(" insert into reply(user_id, words_id, content) values(#{userId}, #{wordsId}, #{content} )")
    int addReply(Reply reply);

    @Delete(" delete from reply where reply_id = #{replyId} ")
    int deleteById(int replyId);

    @Delete(" delete from reply where words_id = #{wordsId} ")
    int deleteAll(int wordsId);

    @Select(" select * from reply where words_id=#{wordsId} order by leave_time desc ")
    List<Reply> getByWords(int wordsId);

    @Select(" select * from reply where reply_id=#{replyId} ")
    Reply getById(int replyId);
}
