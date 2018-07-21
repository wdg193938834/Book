<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上书城</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
		
	function formatProPic(val,row){
		return "<img width=100 height=100 src='${pageContext.request.contextPath}/static/images/"+val+"'>";
	}
	function searchBook(){
		$("#dg").datagrid('load',{
			"name":$("#s_name").val()
		});
	}
	function formatBookType(val,row){
		return val.name;
	}
	function deleteBook(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/book/delete.do",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","数据已成功删除！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败！");
					}
				},"json");
			}
		});
	}
	function saveProduct(){
		$("#fm").form("submit",{
			url:"${pageContext.request.contextPath}/book/add.do",
			onSubmit:function(){
				
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功");
					$("#dg").datagrid("reload");
					$("#dlg").dialog("close");
				}else{
					$.messager.alert("系统提示","保存失败");
					return;
				}
			}
		});
		
	}
	function resetValue(){
		$("#name").val("");
		$("#author").val("");
		$("#chubanshe").val("");
		$("#dangprice").val("");
		$("#kucun").val("");
		$("#xiaoliang").val("");
		$("#type").combobox("setValue","");
		
	}
	
	function closeProductDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	function openProductAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加图书信息");
		url="${pageContext.request.contextPath}/book/add.do";
	}
	 function openProductModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑图书信息");
		$("#id").val(row.id);
		$("#name").val(row.name);
		$("#author").val(row.author);
		$("#chubanshe").val(row.chubanshe);
		$("#dangprice").val(row.dangprice);
		$("#kucun").val(row.kucun);
		$("#xiaoliang").val(row.xiaoliang);
		$("#type").combobox("setValue",row.booktype.id);
		url="${pageContext.request.contextPath}/book/add.do?book.id="+row.id;
	}
	
	function openBlogModifyTab(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一个要修改的图书！");
			return;
		}
		var row=selectedRows[0];
		window.parent.openTab('修改图书','modifyBlog.jsp?id='+row.id,'icon-writeblog');
	}
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="图书管理" class="easyui-datagrid" 
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/book/list.do" fit="true" toolbar="#tb">
  <thead>
  	<tr>
  		<th field="cb" checkbox="true" align="center"></th>
  		<th field="id" width="20" align="center">ID</th>
  		<th field="name" width="20" align="center" >书名</th>
  		 <th field="author" width="20" align="center">作者</th>
  		<th field="image" width="40" align="center" formatter="formatProPic">图片</th>
  		<th field="chubanshe" width="20" align="center">出版社</th>
  		<th field="dangprice" width="20" align="center">当当价</th>
  		<th field="kucun" width="20" align="center">库存</th>
  		<th field="xiaoliang" width="20" align="center">销量</th>
  		<th field="booktype" width="30" align="center" formatter="formatBookType">类别</th>
  	</tr>
  </thead>
</table>
<div id="tb">
	<div>
	<a href="javascript:openProductAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:openProductModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">更改</a>
		<a href="javascript:deleteBook()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
	<div>
		&nbsp;书名&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchBook()"/>
		<a href="javascript:searchBook()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 600px;height:450px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/book/add.do"">
	 		<table cellspacing="8px">
	 			<tr >
	 				<td colspan="4"><input type="hidden" id="id" name="id" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>图书名称：</td>
	 				<td colspan="4"><input type="text" id="name" name="name" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>作者：</td>
	 				<td colspan="4"><input type="text" id="author" name="author" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>商品图片：</td>
	 				<td colspan="4"><input type="file" id="image" name="proPic" formatter="formatProPic" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>出版社：</td>
	 				<td colspan="4"><input type="text" id="chubanshe" name="chubanshe" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>价格：</td>
	 				<td colspan="4"><input type="text" id="dangprice" name="dangprice" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>库存：</td>
	 				<td colspan="4"><input type="text" id="kucun" name="kucun" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>销量：</td>
	 				<td colspan="4"><input type="text" id="xiaoliang" name="xiaoliang" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>所属类别：</td>
	 				<td colspan="4">
	 					<input class="easyui-combobox" id="type" name="booktype.id" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/type/combolist.do'"/>
	 				</td>
	 			</tr>
	 		</table>
	 		
	 	</form>
	 	<a href="javascript:saveProduct()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeProductDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
</body>
</html>