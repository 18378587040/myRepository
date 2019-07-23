<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function abc(obj){
	$('#role_dialog').dialog({    
	    title: '分配权限',    
	    width: 400,    
	    height: 200,    
	    closed: false,    
	    cache: false,    
	    href: '/sys/privilege.jsp',    
	    modal: true,
	    onLoad:function(){
	    	$("#privilege_form :hidden:eq(0)").val($(obj).parent().parent().siblings("[field='id']").children().eq(0).html());
	    	$('#privilege_tree').tree({    
	    	    url:'showPrivilege?id='+$(obj).parent().parent().siblings("[field='id']").children().eq(0).html(),
	    	    checkbox:true		
	    	}); 
	    }
	}); 
}
	
	$(function(){
		$('#role_datagrid').datagrid({    
		    url:'showRole',    
		    columns:[[    
		        {field:'id',title:'编号',width:100,hidden:true},    
		        {field:'name',title:'角色名称',width:100},    
		        {field:'sort',title:'排序',width:100,align:'right'},    
		        {field:'remark',title:'备注',width:100,align:'right'},    
		        {field:'edit',title:'操作',width:100,align:'right',
		        	formatter: function(value,row,index){
						return "<a href='javascript:void(0)' onclick='javascript:abc(this);return false;'>分配权限</a>&nbsp&nbsp<a href='#'>查看</a>";
					}
	
		        }    
		    ]],
		    //分页工具栏
		    pagination:true,
		    //显示行数
		    rownumbers:true,
		    //只能选中一行
		    singleSelect:true,
		    //选择分页条数
		    pageList:[2,4,6],
		    //填满页面
		    fitColumns:true,
		   	//显示斑马线效果
		    striped:true,
		    toolbar: [{
				iconCls: 'icon-add',
				text: '新增',
				handler: function(){alert('正在完善中...')}
			},'-',{
				iconCls: 'icon-remove',
				text: '删除',
				handler: function(){alert('正在完善中...')}
			},'-',{
				iconCls: 'icon-edit',
				text: '修改',
				handler: function(){
					//判断是否选中要修改的列
					if($("#role_datagrid").datagrid('getSelections').length==1){
						//弹出框
						$('#role_dialog').dialog({    
						    title: '修改',    
						    width: 500,    
						    height: 300,    
						    closed: false,    
						    cache: false,    
						    href: '/sys/role_edit.jsp',    
						    modal: true,
						    //弹出框之前加载
						    onLoad:function(){
								$("#role_edit_form :text:eq(0)").val($("#role_datagrid").datagrid('getSelected').name);	
								$("#role_edit_form :text:eq(1)").val($("#role_datagrid").datagrid('getSelected').sort);
								$("#role_edit_form :text:eq(2)").val($("#role_datagrid").datagrid('getSelected').remark);
								$("#role_edit_form :hidden:eq(0)").val($("#role_datagrid").datagrid('getSelected').id)
						    }
						}); 
					}else{
						$.messager.alert('系统消息','请选择一行！');
					}					
				}
			}]

		}); 
	})
</script>
<table id="role_datagrid"></table> 
<div id="role_dialog">Dialog Content.</div> 
</body>
</html>