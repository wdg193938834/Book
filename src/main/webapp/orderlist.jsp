<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	function searchBlog(){
		$("#dg").datagrid('load',{
			"orderNo":$("#s_orderNo").val()
		});
	}
	
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="订单管理" class="easyui-datagrid" 
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/order/list.do" fit="true" toolbar="#tb">
  <thead>
  	<tr>
  		<th field="cb" checkbox="true" align="center"></th>
  		<th field="id" width="20" align="center">ID</th>
  		<th field="orderNo" width="20" align="center" >订单号</th>
  		<th field="money" width="20" align="center">金额</th>
  		<th field="date" width="40" align="center" >日期</th>
  		<th field="state" width="20" align="center">状态</th>
  		<th field="yonghu" width="20" align="center">用户</th>
  		<th field="address" width="20" align="center">地址</th>
  	</tr>
  </thead>
</table>
<div id="tb">
	<div>
		&nbsp;标题&nbsp;<input type="text" id="s_orderNo" size="20" onkeydown="if(event.keyCode==13) searchBlog()"/>
		<a href="javascript:searchBlog()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	</div>
</div>


	
</body>
</html>