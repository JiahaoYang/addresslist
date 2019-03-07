package qsh.dao;

import org.apache.ibatis.annotations.*;
import qsh.entity.Message;

import java.util.List;

@Mapper
public interface MessageDAO {

    @Insert(" insert into message(from_user, to_user, ref_class, message) values(#{fromUser}, #{toUser}, #{refClass}, #{message}) ")
    @Options(useGeneratedKeys = true, keyProperty = "messageId")
    int addMessage(Message message);

    @Select(" select * from message where to_user=#{toUser} order by message_id desc ")
    List<Message> getMine(int toUser);

    @Delete(" delete from message where message_id=#{messageId} ")
    int deleteById(int messageId);

    @Select(" select * from message where from_user=#{fromUser} and ref_class=#{refClass} and message=#{message} ")
    Message judgeIn(int fromUser, int refClass, String message);

    @Select(" select * from message where message_id=#{messageId}")
    Message getById(int messageId);

}
