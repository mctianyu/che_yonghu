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
  <s:form action="user_zhuce" method="post" namespace="/" onsubmit="return check()">
  <table border="0" width="300" height="500">
  <tr><td><s:textfield name="account" placeholder="请输入账号" size="22"/><s:actionerror/></td></tr>
  <tr><td><s:textfield name="name" placeholder="请输入用户名" size="22"/></td></tr>
  <tr><td><s:textfield name="password" id="password" placeholder="请输入密码" size="22"/></td></tr>
  <tr><td><s:textfield name="repassword" id="password" placeholder="请再次输入密码" size="22"/></td></tr>
  </table>
  <button type="submit">提交注册</button>
  </s:form>
</body>
</html>