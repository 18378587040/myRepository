package com.zgm.mapper;

import org.apache.ibatis.annotations.Select;

import com.zgm.pojo.Users;

public interface UsersMapper {
	@Select("select * from users where username=#{username} and password=#{password}")
	Users selByUser(Users users);
}
