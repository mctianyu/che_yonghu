<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkusrn() {
		var check = false;
		var account = document.getElementById("account").value;
		if (account.length > 10) {
			document.getElementById("checktext1").innerHTML = "❌不要多于10位";
			check = false;
		} else {
			document.getElementById("checktext1").innerHTML = "✔";
			check = true;
		}
		return check;
	}
	function isname() {
		var check = false;
		var name = document.getElementById("name").value;
		if (name.length <= 0) {
			document.getElementById("checktext4").innerHTML = "❌用户名不能为空";
			check = false;
		} else {
			document.getElementById("checktext4").innerHTML = "✔";
			check = true;
		}
		return check;
	}

	function isphone() {
		var check = false;
		var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
		var phone = document.getElementById("phone").value;
		if (!myreg.test(phone)) {
			document.getElementById("checktext5").innerHTML = "❌请填写正确的手机号码";
			check = false;
		} else {
			document.getElementById("checktext5").innerHTML = "✔手机号码填写正确";
			check = true;
		}
		return check;
	}
	
	function isdrive(){
		var check = false;
		var drive = document.getElementById("drive").value;
		if (drive.length < 10) {
			document.getElementById("checktext6").innerHTML = "❌不要少于10位";
			check = false;
		} else {
			document.getElementById("checktext6").innerHTML = "✔";
			check = true;
		}
		return check;
	}
	function checkpwd() {
		var check = false;
		var password = document.getElementById("password").value;
		if (password.length < 6) {
			document.getElementById("checktext2").innerHTML = "❌不要少于6位";
			check = false;
		} else {
			document.getElementById("checktext2").innerHTML = "✔";
			check = true;
		}
		return check;
	}
	
	function checkpwdc() {
		var check = false;
		var password = document.getElementById("password").value;
		var pwdc = document.getElementById("pwdc").value;
		if (password != pwdc) {
			document.getElementById("checktext3").innerHTML = "❌ 两次输入密码不一致";
			check = false;
		} else {
			document.getElementById("checktext3").innerHTML = "√";
			check = true;
		}
		return check;
	}
	function checkcb() {
		var check = false

		if (!document.getElementsByName("checkbox")[0].checked) {
			document.getElementById("checktext4").innerHTML = "❌请同意我们的条款才可以继续申请";
			check = false;
		} else {
			document.getElementById("checktext4").innerHTML = "✔";
			check = true;

		}
		return check;

	}
	function check() {
		var check = checkusrn() && checkpwd() && checkpwdc() && isphone() && isdrive() && checkcb() && isname();
		return check;

	}
</script>
</head>
<body>
	<s:form action="user_zhuce" method="post" namespace="/"
		onsubmit="return check()">
		<table border="0" width="500" height="600">
			<tr>
				<td>账号:</td><td><s:textfield name="account" id="account" size="22"
						onchange="checkusrn()" /></td><td id="checktext1">
				<s:actionerror /></td>
			</tr>
			<tr>
				<td>用户名:</td><td><s:textfield name="name" id="name" onchange="isname()"/></td><td id="checktext4"></td>
			</tr>
			<tr>
				<td>电话:</td><td><s:textfield name="phone" id="phone" onchange="isphone()" /></td><td id="checktext5">
				</td>
			</tr>
			<tr>
				<td>驾驶证号:</td><td><s:textfield name="drive" id="drive" onchange="isdrive()" /></td><td id="checktext6">
				</td>
			</tr>
			<tr>
				<td>密码:</td><td><s:textfield name="password" id="password"
						onchange="checkpwd()" size="22" /></td><td id="checktext2">
				</td>
			</tr>
			<tr>
				<td>确认密码:</td><td><s:textfield name="pwdc" id="pwdc"
						onchange="checkpwdc()" size="22" /></td><td id="checktext3">
				</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="checkbox" onchange="checkcb()" /></td> <td>
    <label> 
           我已经阅读了租车条款并同意 
    </label> </td>
    <td id="checktext4"></td> 
			</tr>
		</table>
		<button type="submit">提交注册</button>
	</s:form>
</body>
</html>