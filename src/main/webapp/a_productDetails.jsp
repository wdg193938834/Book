<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上书城</title>
<script type="text/javascript">
	function addShoppingCart(bookId){
		if('${currentUser.name}'==''){
			alert("请先登录，然后购物！");
		}else{
			$.post("${pageContext.request.contextPath}/add.do",{bookId:bookId},
				function(result){
					var result=eval('('+result+')');
					if(result.success){
						alert("已成功加入购物车！");
					}else{
						alert(result.error);
					}
				}
			);
		}
	}
	
	
</script>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="common/top.jsp"/>
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<jsp:include page="common/left.jsp"/>
	</div>
<div id="product"  class="main">
	<h1>${book.name}</h1>
	<div class="infos">
		<div class="thumb">
			<img class="img" src="${pageContext.request.contextPath}/static/images/${book.image }" />
		</div>
		<div class="buy">
			<br/>
			<p>
				商城价：<span class="price">￥${book.dangprice}</span>
			</p>
			<p>库 存：${book.kucun}</p>
			<br/>
			<div class="button">
				 <input type="button" name="button" value="" onclick="" /><br/> 
				<a href="javascript:addShoppingCart(${book.id })">放入购物车</a>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="introduce">
		<h2>
			<strong>出版社</strong>
		</h2>
		<div class="text">
			${book.chubanshe}
		</div>
	</div>
</div>
<div id="footer">
	<jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>