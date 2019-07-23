package com.zgm.service;

import java.util.List;

import com.zgm.pojo.EasyuiDatagrid;
import com.zgm.pojo.Menu;
import com.zgm.pojo.Role;

public interface RoleService {
	EasyuiDatagrid showRole(int pageSize,int pageNumber);
	
	int updRole(Role role);
	
	
	List<Menu> showPrivilege(int roleid);
}
