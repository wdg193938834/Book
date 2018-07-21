<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="box">
	<h2>商品分类</h2>
	<dl>
		<c:forEach items="${typelist }" var="bigType">
			
			<a href="${pageContext.request.contextPath}/findByTypeId.do?id=${bigType.id }" ><dt>${bigType.name }</dt></a>
		</c:forEach>	
	</dl>
</div>
</body>
</html>