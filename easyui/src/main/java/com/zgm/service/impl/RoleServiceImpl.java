package com.zgm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zgm.mapper.MenuMapper;
import com.zgm.mapper.RoleMapper;
import com.zgm.pojo.EasyuiDatagrid;
import com.zgm.pojo.Menu;
import com.zgm.pojo.Role;
import com.zgm.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService{
	@Resource
	private RoleMapper roleMapper;
	@Resource
	private MenuMapper menuMapper;
	@Override
	public EasyuiDatagrid showRole(int pageSize, int pageNumber) {
		EasyuiDatagrid easyuiDatagrid = new EasyuiDatagrid(); 
		easyuiDatagrid.setRows(roleMapper.selByPage(pageSize*(pageNumber-1), pageSize));
		easyuiDatagrid.setTotal(roleMapper.selCount());
		return easyuiDatagrid;
	}
	@Override
	public int updRole(Role role) {
		return roleMapper.updRole(role);
	}
	@Override
	public List<Menu> showPrivilege(int roleid) {
		//��ǰ��ɫ��Ӧ��һ���˵�
		List<Menu> listParent = menuMapper.selByPidRid(0, roleid);
		List<Menu> listRole = new ArrayList<>();
		for (Menu menu : listParent) {
			//ͨ���˵�id��ѯ��ɫ�Ĳ˵�
			listRole.addAll(menuMapper.selByPidRid(menu.getId(), roleid));
		}
		//ȫ��һ���˵�
		List<Menu> listAll = menuMapper.selAll();
		for(Menu menu : listAll) {
			//��Ĭ��ѡ���Ӳ˵���������
//			for (Menu parent : listParent) {
//				if(parent.getId()==menu.getId()) {
//					menu.setChecked(true);
//				}
//			}
			//�Ӳ˵�
			List<Menu> listChildren = menuMapper.selByPid(menu.getId());
			for (Menu chil : listChildren) {
				for (Menu menu2 : listRole) {
					if(menu2.getId()==chil.getId()) {
						chil.setChecked(true);
					}
				}
			}
			menu.setChildren(listChildren);
		}
		return listAll;
	}

}
