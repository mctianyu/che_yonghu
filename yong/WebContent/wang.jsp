<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
     function check(){
     var pwd1 = document.getElementsByName("password")[0].value;
     var pwd2 = document.getElementsByName("repassword")[0].value;
     if (pwd1 != pwd2){
    	 alert("两次输入的密码不一致， 请从新输入");
    	 return false;
     }
     return true;
     }
</script>
</head>
<body>
	<s:form action="user_xiu" method="post" namespace="/" onsubmit="return check()">
		<table border="0" width="300" height="500">
			<tr>
				<td>手机号:<s:textfield name="phone" /></td>
			</tr>
			<tr>
				<td>身份证号:<s:textfield name="idCard" /></td>
			</tr>	
			<tr>
				<td>驾驶证号：<s:textfield name="drive" /></td>
			</tr>
			<tr>
				<td>邮箱：<s:textfield name="email" /></td>
			</tr>
			<tr>
				<td><s:actionerror/></td>
			</tr>
			
		</table>
		<button type="submit">验证提交</button>
	</s:form>
	
</body>
</html>