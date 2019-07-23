<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css">
<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#main_menu').tree({
			url : 'showMenu',
			onClick:function(node){
				if($("#menu_tabs").tabs("getTab",node.text)==null){
					$('#menu_tabs').tabs('add',{
						title: node.text,
						selected: true,
						href:'/'+node.attributes.filename,
						closable:true
					});
				}else{
					$("#menu_tabs").tabs("select",node.text);
				}
			}
		});
	})
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'至尊管理系统'"
		style="height: 100px;">
		<div
			style="float: left; font-size: 20px; font-weight: bold; line-height: 70px; padding-left: 20px">
			至尊管理系统</div>
		<div
			style="float: right; font-size: 20px; font-weight: bold; line-height: 70px; padding-right: 20px">
			你好，${user.username}欢迎登录！</div>
	</div>
	<div data-options="region:'south',title:'底部声明'" style="height: 100px;">
		<div
			style="height: 70px; line-height: 70px; text-align: center; color: gray">
			Copyright &copy; 2019周国明</div>
	</div>
	<div data-options="region:'west',title:'菜单'" style="width: 200px;">
		<div>
			<ul id="main_menu"></ul>
		</div>
	</div>
	<div data-options="region:'center',title:'内容'"
		style="padding: 5px; background: #eee;">
		<div id="menu_tabs" class="easyui-tabs" style="width: 500px; height: 250px;" data-options="fit:true">
			<div title="首页" style="padding: 20px;"></div>
		</div>
	</div>
</body>
</html>