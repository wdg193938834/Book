<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上书城</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
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


<div id="logo">
	<img src="images/logo.gif" />
</div>
<div class="help">
	<c:choose>
		<c:when test="${not empty currentUser }">
			<a href="shopping_list.action" class="shopping">购物车(${shoppingCart.shoppingCartItems==null?0:shoppingCart.shoppingCartItems.size() }件商品)</a>
			<a href="user_userCenter.action">${currentUser.name }</a>
			<a href="javascript:logout()">注销</a>
			<a href="register.jsp">注册</a>
			<a href="comment_list.action">留言</a>	
		</c:when>
		<c:otherwise>
			<a href="javascript:checkLogin()" class="shopping">购物车</a>
			<a href="login.jsp">登录</a>
			<a href="register.jsp">注册</a>
			<a href="comment_list.action">留言</a>		
		</c:otherwise>
	</c:choose>

	<form action="product.action" method="post">
		<input type="text" id="txtSearch" name="s_product.name"
			onkeyup="" autocomplete="off" value="${s_product.name }" /> <input
			type="submit" id="cmdSearch"  value="搜索" /><br/>
		<div id="suggest" style="width: 200px"></div>
	</form>
</div>


<div class="navbar">
	<ul class="clearfix">
		<li class="current"><a href="index.jsp">首页</a>
		</li>
		<c:forEach var="type" items="${typelist }">
			<li>
				<a href="product.action?s_product.type.id=${type.id }">${type.name }</a>
			</li>
		</c:forEach>
	</ul>
</div>
<div class="main">
	<div class="product-list">
			<h2>全部商品</h2>
			<ul class="product clearfix">
				<c:forEach items="${booklist }" var="p">
					<li>
						<dl>
							<dt>
								<a href="product_showProduct.action?productId=${p.id }" target="_blank"><img src="${pageContext.request.contextPath}/static/images/${p.image }"/></a>
							</dt>
							<dd class="title">
								<a href="product_showProduct.action?productId=${p.id }" target="_blank">${p.name }</a>
							</dd>
							<dd class="price">
								￥${p.dangprice }
							</dd>
						</dl>
					</li>
				</c:forEach>
			</ul>
			<div class="clear"></div>
			<div class="pager">
						<ul class="clearfix">
							${pageCode }
						</ul>
			</div>
	</div>
</div>

</body>
</html>