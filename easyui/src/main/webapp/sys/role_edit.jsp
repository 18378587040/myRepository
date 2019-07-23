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
		$(function(){
			$("#role_edit_submit").click(function(){
				$('#role_edit_form').form('submit', {    
				    url:'update',    
				    onSubmit: function(){    
	   					
				    },    
				    success:function(data){    
				        if(data==1){
				        	//弹出框关闭
				        	$("role_dialog").dialog("close");
				        	//刷新
				        	$("role_table").dialog("reload");
				        }else{
				        	$.messager.alert('系统消息','修改失败，请重新修改！');
				        }
				    }    
				});  
			})
		})
	</script>
	<div style="padding: 10px;">
		系统设置   >> 角色管理
		<hr />
		<form action="" method="post" id="role_edit_form">
			<table style="padding-left: 100px">
				<tr>
					<td>角色名称</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>排序</td>
					<td><input type="text" name="sort" /></td>
				</tr>
				<tr>
					<td>备注</td>
					<td><input type="text" name="remark" /></td>
				</tr>
				<tr>
					<td rowspan="2">
						<a id="role_edit_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">确认修改</a>  
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>