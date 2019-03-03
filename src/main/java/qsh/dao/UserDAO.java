package qsh.dao;

import org.apache.ibatis.annotations.*;
import qsh.entity.User;

@Mapper
public interface UserDAO {

    @Select(" select * from user where user_id=#{userId} ")
    User getById(int userId);

    @Select(" select * from user where username=#{username} ")
    User getByName(String username);

    int addUser(User user);

    int updateUser(User user);

    @Update(" update user set password=#{password} where username=#{username}" )
    int updatePassword(String username, String password);

}
