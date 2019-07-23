package com.zgm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.zgm.pojo.Menu;

public interface MenuMapper {
	@Select("select * from menu where pid=0")
	List<Menu> selAll();
	@Select("select * from menu where pid=#{0}")
	List<Menu> selByPid(int id);
	@Select("select * from menu where pid=#{0} and id in(select mid from role_menu where rid=#{1})")
	List<Menu> selByPidRid(int pid,int roleid);
}
