package com.zgm.pojo;

import java.util.List;

public class EasyuiDatagrid {
	//显示当前页数据
	private List<?> rows;
	//显示表中的总数据
	private int total;
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
