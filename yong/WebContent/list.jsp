<%@ page language="java" import="java.util.*,org.bigjava.service.impl.*" pageEncoding="utf-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<head>

<style>
ul.pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
}

ul.pagination li {display: inline;}

ul.pagination li a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
}


ul.pagination li a:hover:not(.active) {background-color: #4CAF50;color: white;border: 1px solid #4CAF50;}
.button {
	background-color: #4CAF50;
	border: none;
	color: black;
	padding: 10px 26px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	cursor: pointer;
}

td {
	align: center
}
</style>

</head>
<body>
	<table border="0" width="900px">
		<tr>
			<td align="left" width="39%" style="font-size: 24px; color: #999">
				个人信息管理</td>
			<td><s:form action="user_mohu" method="post" namespace="/">
			根据用户名查询:<input type="text" name="name"/><button class="button" type="submit">搜索</button>
			</s:form></td>

			<td width="57%" align="right"><a
				href="${ pageContext.request.contextPath }/user_saveUI.action"
				class="button">添加</a></td>
		</tr>
	</table>

	<br />
	<table cellspacing="0" border="1" class="table1">
		<thead>
			<tr>
				<th width="10%">账号</th>
				<th width="10%">用户名</th>
				<th width="10%">钱包</th>
				<th width="10%">性别</th>
				<th width="10%">身份证</th>
				<th width="10%">电话</th>
				<th width="10%">驾驶证号</th>
				<th width="10%">邮箱</th>
				<th width="10%">地址</th>
				<th width="5%">编辑</th>
				<th width="5%">删除</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="#request.list" var="u">
				<tr>
					<td><s:property value="#u.account" /></td>
					<td><s:property value="#u.name" /></td>
					<td><s:property value="#u.wallet" /></td>
					<td><s:property value="#u.six" /></td>
					<td><s:property value="#u.idCard" /></td>
					<td><s:property value="#u.phone" /></td>
					<td><s:property value="#u.drive" /></td>
					<td><s:property value="#u.email" /></td>
					<td><s:property value="#u.address" /></td>
					<td><a
						href="${ pageContext.request.contextPath }/user_edit.action?user_id=<s:property value="#u.user_id"/>">修改
					</a></td>
					<td><a
						href="${ pageContext.request.contextPath }/user_delete.action?user_id=<s:property value="#u.user_id"/>">删除</a></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<br />

        <ul class="pagination">
        <li><a href="${ pageContext.request.contextPath }/user_findAll.action?currPage=1" >首页</a></li>
        <li><a href="${ pageContext.request.contextPath }/user_findAll.action?currPage=<s:property value="currPage-1"/>" >[上一页]</a></li>
        <s:iterator var="i" begin="1" end="totalPage">
        <li><a href="${ pageContext.request.contextPath }/user_findAll.action?currPage=<s:property value="#i"/>"><s:property value="#i"/></a></li>
        </s:iterator>	
        <li><a href="${ pageContext.request.contextPath }/user_findAll.action?currPage=<s:property value="currPage+1"/>">[下一页]</a></li>
        <li><a href="${ pageContext.request.contextPath }/user_findAll.action?currPage=<s:property value="totalPage"/>">[尾页]</a></li>
        </ul>
	
</body>
</html>