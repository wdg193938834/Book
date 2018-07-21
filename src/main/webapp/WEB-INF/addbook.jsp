<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加图书</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

	
function saveProduct(){
	$("#fm").form("submit",{
		url:"${pageContext.request.contextPath}/book/add.do",
		onSubmit:function(){
			
		},
		success:function(result){
			var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","保存成功");
			}else{
				$.messager.alert("系统提示","保存失败");
				return;
			}
		}
	});
	
}
	
	
	
</script>
</head>
<body>
<form id="fm" action="${pageContext.request.contextPath}/book/add.do" method="post" enctype="multipart/form-data">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>图书名称：</td>
	 				<td colspan="4"><input type="text" id="name" name="name" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>作者：</td>
	 				<td colspan="4"><input type="text" id="name" name="author" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>商品图片：</td>
	 				<td colspan="4"><input type="file" id="pP" name="proPic" /></td>
	 			</tr>
	 			<tr>
	 				<td>出版社：</td>
	 				<td colspan="4"><input type="text" id="price" name="chubanshe" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>价格：</td>
	 				<td colspan="4"><input type="text" id="price" name="dangprice" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>库存：</td>
	 				<td colspan="4"><input type="text" id="stock" name="kucun" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>销量：</td>
	 				<td colspan="4"><input type="text" id="stock" name="xiaoliang" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>所属类别：</td>
	 				<td colspan="4">
	 					<input class="easyui-combobox" id="type" name="booktype.id" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/type/combolist.do'"/>
	 				</td>
	 			</tr>
	 		</table>
	 		<input type="submit"  value="提交"/> 
	 	</form>
</body>
</html>