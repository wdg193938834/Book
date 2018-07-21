<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上书城</title>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="common/top.jsp"/>
</div>

<div id="main" class="wrap">
	<div class="lefter">
		<jsp:include page="common/left.jsp"/>
	</div>
	
	<div class="main">
	<div class="product-list">
			<h2>全部商品</h2>
			<ul class="product clearfix">
				<c:forEach items="${booklist }" var="p">
					<li>
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath}/findById.do?id=${p.id }" target="_blank"><img src="${pageContext.request.contextPath}/static/images/${p.image }"/></a>
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
			
	</div>
</div>
<div id="footer">
	<jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>