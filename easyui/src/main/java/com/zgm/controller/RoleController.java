package com.zgm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zgm.pojo.EasyuiDatagrid;
import com.zgm.pojo.Menu;
import com.zgm.pojo.Role;
import com.zgm.service.RoleService;

@Controller
public class RoleController {
	@Resource
	private RoleService roleServiceImpl;
	@RequestMapping("page/showRole")
	@ResponseBody
	public EasyuiDatagrid showRole(@RequestParam(defaultValue = "2") int rows,@RequestParam(defaultValue = "1")int page) {
		return roleServiceImpl.showRole(rows, page);
	}
	
	@RequestMapping("page/update")
	@ResponseBody
	public int updRole(Role role) {
		int index = roleServiceImpl.updRole(role);
		return index;
	}
	@RequestMapping("showPrivilege")
	@ResponseBody
	public List<Menu> showPrivilege(int id){
		return roleServiceImpl.showPrivilege(id);
	}
	
}
