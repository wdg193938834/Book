<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上书城</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script> 
$(function(){
	
	$(".add").click(function(){
		var t=$(this).parent().find('input[class=text_box]');
		t.val(parseInt(t.val())+1);
		var product_id=$(this).parent().find('input[id=product_id]').val();
		var price=$("#price_"+product_id).html();
		$("#productItem_total_"+product_id).html(price*t.val());
		
		refreshSession(product_id,t.val());
		setTotal();
	});
	
	$(".min").click(function(){
		var t=$(this).parent().find('input[class=text_box]');
		t.val(parseInt(t.val())-1);
		if(parseInt(t.val())<0){
			t.val(0);
		}
		var product_id=$(this).parent().find('input[id=product_id]').val();
		var price=$("#price_"+product_id).html();
		$("#productItem_total_"+product_id).html(price*t.val());
		
		refreshSession(product_id,t.val());
		setTotal();
	});
	
	$(".text_box").blur(function(){
		var t=$(this).parent().find('input[class=text_box]');
		if(parseInt(t.val())<0){
			t.val(0);
		}
		var product_id=$(this).parent().find('input[id=product_id]').val();
		var price=$("#price_"+product_id).html();
		$("#productItem_total_"+product_id).html(price*t.val());
		
		refreshSession(product_id,t.val());
		setTotal();
	});
	
	function setTotal(){
		var s=0;
		$(".productTr").each(function(){
			var n=$(this).find('input[class=text_box]').val();
			var price=$(this).find('label[class=price_]').html();
			s+=n*price;
		});
		$("#product_total").html(s);
	}
	
	function refreshSession(productId,count){
		$.post("${pageContext.request.contextPath}/update.do",{bookId:productId,count:count},
			function(result){
				var result=eval('('+result+')');
				if(result.success){
					
				}else{
					alert("刷新Session失败");
				}
			}
		);
	}
	
	setTotal();
	
});
function submit(){
	$.post("${pageContext.request.contextPath}/submit.do",{total:$("#product_total").html()},
		function(result){
			var result=eval('('+result+')');
			if(result.success){
				alert("提交订单成功");
				window.location.href="a_shoppingResult.jsp";
			}else{
				alert("刷新Session失败");
			}
		}
	);
}


function removeShopping(productId){
	if(confirm("您确定要删除这个商品吗？")){
		window.location.href="${pageContext.request.contextPath}/delete.do?bookId="+productId;
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
	
<div id="shopping">
		<form action="javascript:submit()" method="post">
			<table id="myTableProduct">
				<tr>
					<th>商品名称</th>
					<th>商品单价</th>
					<th>金额</th>
					<th>购买数量</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${cart.cartItems}" var="shoppingCartItem">
					<tr class="productTr">
						<td class="thumb">
							<img class="imgs" src="${pageContext.request.contextPath}/static/images/${shoppingCartItem.book.image }" /><a href="${pageContext.request.contextPath}/findById.do?id=${shoppingCartItem.book.id }" target="_blank">${shoppingCartItem.book.name}</a>
						</td>
						<td class="price" ><span>￥<label class="price_" id="price_${shoppingCartItem.book.id }">${shoppingCartItem.book.dangprice }</label></span> 
						</td>
						<td class="price" >
							<span>￥<label id="productItem_total_${shoppingCartItem.book.id }">${shoppingCartItem.book.dangprice*shoppingCartItem.count }</label></span>
						</td>
						<td class="number">
						        <input type="hidden" id="product_id" value="${shoppingCartItem.book.id }"/>
								<input class="min" name="" type="button" value=" - "  /> 
								<input class="text_box"  style="width: 30px;text-align: center" name="" type="text" value="${shoppingCartItem.count }" /> 
								<input class="add" name="" type="button" value=" + " /> 
						</td>
						<td class="delete"><a
							href="javascript:removeShopping(${shoppingCartItem.book.id })">删除</a>
						</td>
					</tr> 
				</c:forEach> 
			</table>

			<div class="button">
				<input type="submit" value=""    /> 
			</div>
		</form>
</div>

<div class="shopping_list_end">

	<ul>
		<li class="shopping_list_end_2">￥<label id="product_total"></label>
		</li>
		<li class="shopping_list_end_3">商品金额总计：</li>
	</ul>
</div>


<div id="footer">
	<jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>