<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		var pwd1 = document.getElementsByName("password")[0].value;
		var pwd2 = document.getElementsByName("repassword")[0].value;
		if (pwd1 != pwd2) {
			alert("两次输入的密码不一致， 请从新输入");
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
input {
	float: left;
	font-size: 14px;
	width: 250px;
	height: 25px;
	border: 1px solid #ccc;
	padding-left: 10px;
}

#tips {
	float: left;
	font-size: 12px;
	width: 400px;
	height: 25px;
	margin: 4px 0 0 20px;
}

#tips span {
	float: left;
	width: 40px;
	height: 20px;
	color: #fff;
	overflow: hidden;
	margin-right: 10px;
	background: #D7D9DD;
	line-height: 20px;
	text-align: center;
}

#tips .s1 {
	background: #FF0000;
} /*红色*/
#tips .s2 {
	background: #7B68EE;
} /*蓝色*/
#tips .s3 {
	background: #FFFF00;
} /*黄色*/
#tips .s4 {
	background: #00FF7F;
} /*绿色*/
</style>
</head>
<body>


	<s:form action="user_update_geren" method="post" namespace="/"
		id="saveForm" theme="simple" onsubmit="return check()">
		<table border="0" width="500" height="">
			<tr>
				<td><s:textfield name="password" value="%{model.password}"
						showPassword="true" id="password" maxlength="16" /></td>
			</tr>
			<tr><td>
			<div id="tips">
				<span>弱</span> <span>中</span> <span>强</span> <span>很强</span>
			</div>
			</td></tr>
			<tr><td>
			<s:textfield name="repassword" id="password"/>
			</td></tr>
		<s:hidden name="user_id" value="%{model.user_id}" />
		<s:hidden name="account" value="%{model.account}" />
		<s:hidden name="name" value="%{model.name}" />
		<s:hidden name="six" value="%{model.six}" />
		<s:hidden name="phone" value="%{model.phone}" />
		<s:hidden name="idCard" value="%{model.idCard}" />
		<s:hidden name="drive" value="%{model.drive}" />
		<s:hidden name="email" value="%{model.email}" />
		<s:hidden name="address" value="%{model.address}" />
		<tr><td>
			<button type="submit">保存</button>
		<a href="javascript:history.go(-1)" class="button">退回</a>
			</td></tr>
		</table>
	</s:form>

</body>
<script type="text/javascript">
	var password = document.getElementById("password"); //获取文本框的对象
	//var value = password.value; //获取用户在文本框里面填写的值
	//获取所有的span标签 返回值是一个数组
	var spanDoms = document.getElementsByTagName("span");
	password.onkeyup = function() {
		//获取用户输入的密码,然后判断其强度 返回0 或者 1 2 3 4
		var index = checkPassWord(this.value);
		for (var i = 0; i < spanDoms.length; i++) {
			spanDoms[i].className = "";//清空span标签所有的class样式
			if (index) {//0 代表false 其余代表true
				spanDoms[index - 1].className = "s" + index;
			}
		}
	}
	//校验密码强度
	function checkPassWord(value) {
		// 0： 表示第一个级别 1：表示第二个级别 2：表示第三个级别
		// 3： 表示第四个级别 4：表示第五个级别
		var modes = 0;
		if (value.length < 6) {//最初级别
			return modes;
		}
		if (/\d/.test(value)) {//如果用户输入的密码 包含了数字
			modes++;
		}
		if (/[a-z]/.test(value)) {//如果用户输入的密码 包含了小写的a到z
			modes++;
		}
		if (/[A-Z]/.test(value)) {//如果用户输入的密码 包含了大写的A到Z
			modes++;
		}
		if (/\W/.test(value)) {//如果是非数字 字母 下划线
			modes++;
		}
		switch (modes) {
		case 1:
			return 1;
			break;
		case 2:
			return 2;
			break;
		case 3:
			return 3;
			break;
		case 4:
			return 4;
			break;
		}
	}
</script>
</html>