<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工管理</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<table id="dg" style="width: 100%; height: 500px"></table>

	<div id="dlg" class="easyui-dialog" title="修改员工信息"
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
					<!-- <tr>
						<td>编号:</td>
						<td><input class="easyui-textbox" disabled="disabled"
							type="text" name="number" id="number"
							data-options="required:true"></td>

					</tr> -->
					
					<tr>
						<td>部门id:</td>
						<td><input class="easyui-textbox" type="text" name="deptId"
							id="deptId" data-options="required:true"></td>
					</tr>
					<tr>
						<td>职位id:</td>
						<td><input class="easyui-textbox" type="text" name="jobId"
							id="jobId" data-options="required:true"></td>
					</tr>
					<tr>
						<td>姓名:</td>
						<td><input class="easyui-textbox" type="text" name="name"
							id="name" data-options="required:true"></td>
					</tr>
					<tr>
						<td>员工id:</td>
						<td><input class="easyui-textbox" type="text" name="cardId"
							id="cardId" data-options="required:true"></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><input class="easyui-textbox" type="text" name="address"
							id="address" data-options="required:true"></td>
					</tr>
					<tr>
						<td>员工号:</td>
						<td><input class="easyui-textbox" type="text" name="postCode"
							id="postCode" data-options="required:true"></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input class="easyui-textbox" type="text" name="tel"
							id="tel" data-options="required:true"></td>
					</tr>
					<tr>
						<td>手机号:</td>
						<td><input class="easyui-textbox" type="text" name="phone"
							id="phone" data-options="required:true"></td>
					</tr>
					<tr>
						<td>QQ号:</td>
						<td><input class="easyui-textbox" type="text" name="qqNum"
							id="qqNum" data-options="required:true"></td>
					</tr>
					<tr>
						<td>邮箱:</td>
						<td><input class="easyui-textbox" type="text" name="email"
							id="email" data-options="required:true"></td>
					</tr>
					<tr>
						<td>性别:</td>
						<td><input class="easyui-textbox" type="text" name="sex"
							id="sex" data-options="required:true"></td>
					</tr>
					<tr>
						<td>关系:</td>
						<td><input class="easyui-textbox" type="text" name="party"
							id="party" data-options="required:true"></td>
					</tr>
					<tr>
						<td>生日:</td>
						<td><input class="easyui-textbox" type="text" name="birthday"
							id="birthday" data-options="required:true"></td>
					</tr>
					<tr>
						<td>民族:</td>
						<td><input class="easyui-textbox" type="text" name="race"
							id="race" data-options="required:true"></td>
					</tr>
					<tr>
						<td>学历:</td>
						<td><input class="easyui-textbox" type="text" name="education"
							id="education" data-options="required:true"></td>
					</tr>
					<tr>
						<td>专业:</td>
						<td><input class="easyui-textbox" type="text" name="speciality"
							id="speciality" data-options="required:true"></td>
					</tr>
					<tr>
						<td>爱好:</td>
						<td><input class="easyui-textbox" type="text" name="hobby"
							id="hobby" data-options="required:true"></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td><input class="easyui-textbox" type="text" name="remark"
							id="remark" data-options="required:true"></td>
					</tr>
					<tr>
						<td>创建时间:</td>
						<td><input class="easyui-textbox" type="text" name="createDate"
							id="createDate" data-options="required:true"></td>
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
	   var row = $("#dg").datagrid('getSelected');
	   var id = $("#id").val();
		var deptId = $("#deptId").val();
		var jobId = $("#jobId").val();
		var name = $("#name").val();
		var cardId = $("#cardId").val();
		var address = $("#address").val();
		var postCode = $("#postCode").val();
		var tel = $("#tel").val();
		var phone = $("#phone").val();
		var qqNum = $("#qqNum").val();
		var email = $("#email").val();
		var sex = $("#sex").val();
		var party = $("#party").val();
		var birthday = $("#birthday").val();
		var race = $("#race").val();
		var education = $("#education").val();
		var speciality = $("#speciality").val();
		var hobby = $("#hobby").val();
		var remark = $("#remark").val();
		var createDate = $("#createDate").val();

		//将得到的学生信息构建成json数据
		var json = {
			"id" : id,
			"deptId":deptId,
			"jobId":jobId,
			"name" : name,
			"cardId" : cardId,
			"address" : address,
			"postCode":postCode,
			"tel":tel,
			"phone":phone,
			"qqNum":qqNum,
			"email":email,
			"sex":sex,
			"party":party,
			"birthday":birthday,
			"race":race,
			"education":education,
			"speciality":speciality,
			"hobby":hobby,
			"remark":remark,
			"createDate":createDate
		};
		//完成ajax操作
		$.post("updateEmployee", json, function(data) {

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
 
/* ajax获取Controller数据，是json数据  */
	$('#dg').datagrid({
		url : '${pageContext.request.contextPath}/selectEmployee',
		title : '员工列表',
		border : false,
		rownumbers : true,
		toolbar : '#tb',
		pagination : true,
		pageSize : "5",
		pageList : [ 5, 10, 15, 20 ],
		singleSelect : true,
		columns : [ [ {
			field : 'id',
			value : 'id',
			checkbox : true,
			title : '选择',
			width : 50
		}, {
			field : 'deptId',
			title : '部门id',
			width : 50
		}, {
			field : 'jobId',
			title : '职位id',
			width : 50
		}, {
			field : 'name',
			title : '姓名',
			width : 70
		},  {
			field : 'cardId',
			title : '员工id',
			width : 100
		}, {
			field : 'address',
			title : '地址',
			width : 100
		}, {
			field : 'postCode',
			title : '员工号',
			width : 70
		}, {
			field : 'tel',
			title : '电话',
			width : 70
		}, {
			field : 'phone',
			title : '手机号',
			width : 100
		}, {
			field : 'qqNum',
			title : 'QQ号',
			width : 100
		}, {
			field : 'email',
			title : '邮箱',
			width : 100
		}, {
			field : 'sex',
			title : '性别',
			width : 50
		}, {
			field : 'party',
			title : '关系',
			width : 50
		}, {
			field : 'birthday',
			title : '生日',
			width : 100
		}, {
			field : 'race',
			title : '民族',
			width : 50
		}, {
			field : 'education',
			title : '学历',
			width : 50
		}, {
			field : 'speciality',
			title : '专业',
			width : 50
		}, {
			field : 'hobby',
			title : '爱好',
			width : 50
		}, {
			field : 'remark',
			title : '备注',
			width : 50
		}, {
			field : 'createDate',
			title : '创建时间',
			width : 100
		} ] ]
	});

	$(function() {
		var pager = $('#dg').datagrid().datagrid('getPager'); // get the pager of datagrid

		pager.pagination({
			buttons : [
					{
						iconCls : 'icon-no',
						text : '删除',
						handler : function() {
							var row = $('#dg').datagrid('getSelected');
							if (row != null) {
								$.messager.confirm('确认是否要删除', '确定要删除('
										+ row.username + ')吗?', function(r) {
									if (r) {
										//ajax：完成后天交互
										$.get("deleteEmployeeById/"
												+ row.id, null, function(
												data) {

											$.messager.alert('结果', data,
													'info', function() {
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
								var row = $('#dg').datagrid('getSelected');
								if (row != null) {

									//读取方式,根据row的字段row.xxx
									$("#id")
											.textbox('setValue', row.id);
									$("#deptId").textbox('setValue',
											row.dept_id);
									$("#jobId").textbox('setValue',
											row.job_id);
									$("#name").combobox('setValue',
											row.name);
									$("#cardId").combobox('setValue',
											row.card_id);
									$("#address").combobox('setValue',
											row.address);
									$("#postCode").combobox('setValue',
											row.post_code);
									$("#tel").combobox('setValue',
											row.tel);
									$("#phone").combobox('setValue',
											row.phone);
									$("#qqNum").combobox('setValue',
											row.qq_num);
									$("#email").combobox('setValue',
											row.email);
									$("#sex").combobox('setValue',
											row.sex);
									$("#party").combobox('setValue',
											row.party);
									$("#birthday").combobox('setValue',
											row.birthday);
									$("#race").combobox('setValue',
											row.race);
									$("#education").combobox('setValue',
											row.education);
									$("#speciality").combobox('setValue',
											row.speciality);
									$("#hobby").combobox('setValue',
											row.hobby);
									$("#remark").combobox('setValue',
											row.remark);
									$("#createDate").combobox('setValue',
											row.create_date);
									$('#dlg').dialog('open');
								}

							}

						}
					} ]
		});

	})
</script>

</html>