<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css">   
<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>   
<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>  
<script type="text/javascript">
	$(function(){
		$("#login_submit").click(function(){
			$('#login_form').form('submit', {    
			    url:'login',    
			    onSubmit: function(){    
			        if($(":text:eq(0)").val() == ""){
			        	$.messager.alert('系统消息','用户名不能为空！'); 
			        }else if($(":password:eq(0)").val() == ""){
			        	$.messager.alert('系统消息','密码不能为空！'); 
			        }
			    },    
			    success:function(data){    
			       if(data==1){
			    	   $.messager.alert('系统消息','登录成功'); 
			    	   location.href="page/main.jsp"
			       }else{
			    	   $.messager.alert('系统消息','登录失败');
			       }   
			    }    
			})
		})
	})
</script>
</head>
<body>
<div style="margin:100px auto;width:500px;">
	<div id="p" class="easyui-panel" title="登录"     
        style="width:500px;height:200px;padding:10px;background:#fafafa;"   
        data-options="iconCls:'icon-save'">   
    <form id="login_form" action="login" method="post">
    	<table width="250" align="center">
    		<tr height="30px">
    			<th colspan="2" style="text-align: center;font-size: 20px;">至尊管理系统</th>
    		</tr>
    		<tr height="30px">
    			<td>用户名：</td>
    			<td><input type="text" name="username" /></td>
    		</tr>
    		<tr height="30px">
    			<td>密码：</td>
    			<td><input type="password" name="password" /></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="right">
    				<a id="login_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">登录</a>  
    			</td>
    		</tr>
    	</table>
    </form> 
</div> 
</div> 
</body>
</html>