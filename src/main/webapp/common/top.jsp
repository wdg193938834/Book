<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript">
	
	
	function checkLogin(){
		if('${currentUser.name}'==''){
			alert("请先登录！");
		}else{
			window.location.href="shopping_list.action";
		}
	}
</script>
</head>
<body>


<div class="help">
	<c:choose>
		<c:when test="${not empty currentUser }">
			<a href="a_cart.jsp" class="shopping">购物车<%-- (${Cart.CartItems==null?0:Cart.CartItems.size() }件商品) --%></a>
			<a href="">${currentUser.name }</a>
			<a href="${pageContext.request.contextPath}/orderList.do">订单</a>
			<a href="${pageContext.request.contextPath}/logout.do">注销</a>
			<a href="a_register.jsp">注册</a>
		</c:when>
		<c:otherwise>
			<a href="javascript:checkLogin()" class="shopping">购物车</a>
			<a href="a_login.jsp">登录</a>
			<a href="a_register.jsp">注册</a>
		</c:otherwise>
	</c:choose>

	<form action="${pageContext.request.contextPath}/findByname.do" method="post">
				<input type="text"  name="name" />
			 <input type="submit" id="cmdSearch"  value="搜索" /><br/>
		<div id="suggest" style="width: 200px"></div>
	</form>
</div>

<div class="navbar">
	<ul class="clearfix">
		<li class="current"><a href="index.jsp">首页</a>
		</li>
		<c:forEach var="type" items="${typelist }">
			<li>
				<a href="${pageContext.request.contextPath}/findByTypeId.do?id=${type.id }">${type.name }</a>
			</li>
		</c:forEach>
	</ul>
</div>



</body>
</html>