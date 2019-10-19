<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门查询</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>

	<table id="dg" style="width: 100%; height: 500px"></table>

	<div id="dlg" class="easyui-dialog" title="修改公告信息"
		style="width: 400px; height: 450px; padding: 10px"
		data-options="
				closed:true,
				iconCls: 'icon-edit',
				toolbar: '#dlg-toolbar',
				buttons: '#dlg-buttons'
			">
		<div>
			<form id="ff" class="easyui-form" method="post">
				<table cellpadding="10">
					<tr>
						<td>ID</td>
						<td><input class="easyui-textbox" type="text" name="id"
							id="id" data-options="required:true" disabled="disabled"></td>
					</tr>
					<tr>
						<td>公告名称:</td>
						<td><input class="easyui-textbox" type="text" name="title"
							id="title" data-options="required:true"></td>
					</tr>
					<tr>
						<td>公告主题:</td>
						<td><input class="easyui-textbox" type="text" name="noticename"
							id="noticename" data-options="required:true"></td>
					</tr>
					<tr>
						<td>公告内容:</td>
						<td><input class="easyui-textbox" type="text" name="matter"
							id="matter" data-options="required:true"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="save()">保存</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>

</body>
<script type="text/javascript">
	function save() {
		//获得控件中的数据

		var title = $("#title").val();
		var noticename = $("#noticename").val();
		var matter = $("#matter").val();
		var id = $("#id").val();

		//将得到的学生信息构建成json数据

		var json = {
			"id" : id,
			"title" : title,
			"noticename" : noticename,
			"matter" : matter

		};
		//完成ajax操作
		$.post("updateNotice", json, function(data) {

			var info = "对不起，修改失败！";
			var pic = "error"
			if (data == "1") {
				info = "恭喜，修改成功！！";
				pic = "info"
			}
			$.messager.alert('结果', info, pic, function() {

				window.location.reload();
			});

		});

	}

	$('#dg').datagrid({
		url : '${pageContext.request.contextPath}/selectNotice',
		title : '公告列表',
		border : false,
		rownumbers : true,
		toolbar : '#tb',
		pagination : true,
		pageSize : "5",
		pageList : [ 5, 10, 15, 20 ],
		singleSelect : true,
		columns : [ [ {
			field : 'id1',
			checkbox : true,
			title : '选择',
			width : 50
		}, {
			field : 'id',
			title : '公告编号',
			width : 220
		}, {
			field : 'title',
			title : '公告名称',
			width : 220
		}, {
			field : 'matter',
			title : '公告内容',
			width : 220
		},{
			field : 'noticename',
			title : '内容',
			width : 220
		} ] ]
	});

	$(function() {
		var pager = $('#dg').datagrid().datagrid('getPager'); // get the pager of datagrid

		pager
				.pagination({
					buttons : [
							{
								iconCls : 'icon-no',
								text : '删除',
								handler : function() {
									var row = $('#dg').datagrid('getSelected');
									if (row != null) {
										$.messager
												.confirm(
														'确认是否要删除',
														'确定要删除(' + row.name
																+ ')吗?',
														function(r) {
															if (r) {

																$
																		.get(
																				"deleteNoticeById/"
																						+ row.id,
																				null,
																				function(
																						data) {

																					$.messager
																							.alert(
																									'结果',
																									data,
																									'info',
																									function() {
																										window.location
																												.reload();
																									});

																				});
															}
														});
									}
								}
							},
							{

								iconCls : 'icon-edit',
								text : '修改',
								handler : function() {
									var row = $('#dg').datagrid('getSelected');
									if (row != null) {
										$('#dlg').dialog('open');
										var row = $('#dg').datagrid(
												'getSelected');
										if (row != null) {

													$("#id").textbox(
															"setValue", row.id),
													//读取方式,根据row的字段row.xxx
													$("#title").textbox(
															'setValue',
															row.title);
											$("#noticename").textbox('setValue',
													row.noticename);
											$("#matter").textbox('setValue',
													row.matter);
											$('#dlg').dialog('open');
										}

									}

								}
							} ]
				});

	})
</script>

</html>