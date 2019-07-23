package com.zgm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zgm.mapper.UsersMapper;
import com.zgm.pojo.Users;
import com.zgm.service.UsersService;
@Service
public class UsersServiceImpl implements UsersService{
	@Resource
	private UsersMapper usersMapper;
	@Override
	public Users login(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.selByUser(users);
	}

}
