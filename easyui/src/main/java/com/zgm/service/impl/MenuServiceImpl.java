package com.zgm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zgm.mapper.MenuMapper;
import com.zgm.pojo.Attribute;
import com.zgm.pojo.Menu;
import com.zgm.service.MenuService;
@Service
public class MenuServiceImpl implements MenuService{
	@Resource
	private MenuMapper menuMapper;
	@Override
	public List<Menu> selAll() {
		List<Menu> list = menuMapper.selAll();
		for (Menu menu : list) {
			List<Menu> chilList = menuMapper.selByPid(menu.getId());
			for (Menu menu2 : chilList) {
				Attribute attributes = new Attribute();
				attributes.setFilename(menu2.getFilename());
				menu2.setAttributes(attributes);
			}
			menu.setChildren(chilList);
		}
		return list;
	}

}
