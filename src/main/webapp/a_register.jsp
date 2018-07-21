<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上书城</title>
<script type="text/javascript">
	
	function checkForm(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		var rePassWord=$("#rePassWord").val();
		var mobile=$("#mobile").val();
		var address=$("#address").val();
		
		if(userName==""){
			$("#error").html("用户名不能为空！");
			return false;
		}
		if(password==""){
			$("#error").html("密码不能为空！");
			return false;
		}
		

	function checkUserName(userName){
		if($("#userName").val()==""){
			$("#userErrorInfo").html("用户名不能为空！");
			$("#userName").focus();
			return;
		}
		$.post("user_existUserWithUserName.action",{userName:userName},
				function(result){
					var result=eval('('+result+')');
					if(result.exist){
						$("#userErrorInfo").html("用户名已存在，请重新输入！");
						$("#userName").focus();
					}else{
						$("#userErrorInfo").html("");
					}
				}
		);
	}
</script>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="common/top.jsp"/>
</div>

<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎注册</h1>
			<ul class="steps clearfix">
				<li class="current"><em></em>填写注册信息</li>
				<li class="last"><em></em>注册成功</li>
			</ul>
			<form id="regForm" method="post" action="${pageContext.request.contextPath}/register.do" onsubmit="return checkForm()">
				<table>				
					
					<tr>
						<td class="field">用户名(*)：</td>
						<td><input class="text" type="text" id="userName" name="userName" onblur="checkUserName(this.value)" />&nbsp;<font id="userErrorInfo" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">登录密码(*)：</td>
						<td><input class="text"  type="password" id="password" name="password"   /></td>
					</tr>
					
					<tr>
						<td class="field">姓名：</td>
						<td><input class="text" type="text" id="name" name="name"  /></td>
					</tr>
					
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" value="提交注册" /></label></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><font id="error" color="red"></font> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>

<div id="footer">
	<jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>