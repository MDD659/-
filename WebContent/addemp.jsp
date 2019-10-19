<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加员工</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="margin: 20px 0;"></div>
	<div class="easyui-panel" title="添加员工"
		style="width: 100%; height: 100%;">
		<div style="padding: 40px 60px 20px 60px;">
			<form id="ff" class="easyui-form" method="post">
				<table cellpadding="10">
					<tr>
						<td>部门id:</td>
						<td><input class="easyui-textbox" type="text" name="deptId"
							data-options="required:true,validType:'length[1,5]'"></td>
						<td>职位id:</td>
						<td><input class="easyui-textbox" type="text" name="jobId"
							data-options="required:true,validType:'length[1,5]'"></td>
						<td>姓名:</td>
						<td><input class="easyui-textbox" type="text" name="name"
							data-options="required:true,validType:'length[2,5]'"></td>
						<td>员工id:</td>
						<td><input class="easyui-textbox" type="text" name="cardId"
							data-options="required:true,validType:'length[2,5]'"></td>
						<td>地址:</td>
						<td><input class="easyui-textbox" type="text" name="address"
							data-options="required:true,validType:'length[2,20]'"></td>
						<td>员工号:</td>
						<td><input class="easyui-textbox" type="text" name="postCode"
							data-options="required:true,validType:'length[2,5]'"></td>
						<td>电话:</td>
						<td><input class="easyui-textbox" type="text" name="tel"
							data-options="required:true,validType:'length[2,7]'"></td>
						<td>手机号:</td>
						<td><input class="easyui-textbox" type="text" name="phone"
							data-options="required:true,validType:'length[2,11]'"></td>
						<td>QQ号:</td>
						<td><input class="easyui-textbox" type="text" name="qqNum"
							data-options="required:true,validType:'length[2,9]'"></td>
						<td>邮箱:</td>
						<td><input class="easyui-textbox" type="text" name="email"
							data-options="required:true,validType:'length[2,5]'"></td>
						<td>性别:</td>
						<td><input class="easyui-textbox" type="text" name="sex"
							data-options="required:true,validType:'length[2,20]'"></td>
						<td>关系:</td>
						<td><input class="easyui-textbox" type="text" name="party"
							data-options="required:true,validType:'length[2,5]'"></td>
						<td>生日:</td>
						<td><input class="easyui-textbox" type="datetime" name="birthday"
							data-options="required:true,validType:'length[2,20]'"></td>
						<td>民族:</td>
						<td><input class="easyui-textbox" type="text" name="race"
							data-options="required:true,validType:'length[2,5]'"></td>
						<td>学历:</td>
						<td><input class="easyui-textbox" type="text" name="education"
							data-options="required:true,validType:'length[2,5]'"></td>
						<td>专业:</td>
						<td><input class="easyui-textbox" type="text" name="speciality"
							data-options="required:true,validType:'length[2,10]'"></td>
						<td>爱好:</td>
						<td><input class="easyui-textbox" type="text" name="hobby"
							data-options="required:true,validType:'length[2,20]'"></td>
						<td>备注:</td>
						<td><input class="easyui-textbox" type="text" name="remark"
							data-options="required:true,validType:'length[2,10]'"></td>
						<td>创建时间:</td>
						<td><input class="easyui-textbox" type="datetime" name="createDate"
							data-options="required:true,validType:'length[2,20]'"></td>
							
					</tr>	
				</table>
			</form>

			<div style="text-align: left; padding: 20px; margin-top: 50px">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitForm()">添加</a> &nbsp;&nbsp;&nbsp; <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="clearForm()">重置</a>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	//easyui使用的是ajax做表单提交
	function submitForm() {
		$('#ff').form('submit', {
			url : "AddEmployeeServlet",
			onSubmit : function() {
				return $(this).form('enableValidation').form('validate');
			},
			success : function(data) {
				
				if (data == "1") {
					//easyui的信息提示框：1.标题，2.提示信息，3.图标
					$.messager.alert('注册成功', '恭喜你,注册成功', 'info');
				} else {
					$.messager.alert('注册失败', '对不起,注册失败了', 'error');
				}
			}

		});
	}
	//置空的方法
	function clearForm() {
		$('#ff').form('clear');
	}
	
</script>
</html>