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
    
	
	<s:form action="user_update_geren" method="post" namespace="/" id="saveForm" theme="simple" onsubmit="return check()">
	<s:textfield name="password" value="%{model.password}" showPassword="true" id="password"/><br/>
	<s:textfield name="repassword" id="password"/>
	
	<s:hidden name="user_id" value="%{model.user_id}" />
	<s:hidden name="account" value="%{model.account}" />
	<s:hidden name="name" value="%{model.name}" />
	<s:hidden name="six" value="%{model.six}" />
	<s:hidden name="phone" value="%{model.phone}" />
	<s:hidden name="idCard" value="%{model.idCard}" />
	<s:hidden name="drive" value="%{model.drive}" />
	<s:hidden name="email" value="%{model.email}" />
	<s:hidden name="address" value="%{model.address}" />
	<br/>
	<button type="submit">保存</button>
	<a href="javascript:history.go(-1)" class="button">退回</a>
</s:form>
</body>
</html>