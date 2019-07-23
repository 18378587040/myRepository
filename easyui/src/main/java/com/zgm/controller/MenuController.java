package com.zgm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zgm.pojo.Menu;
import com.zgm.service.MenuService;

@Controller
public class MenuController {
	@Resource
	private MenuService menuServiceimpl;
	
	@RequestMapping("page/showMenu")
	@ResponseBody
	public List<Menu> showMenu() {
		return menuServiceimpl.selAll();
		
	}
}
