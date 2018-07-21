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
		function formatanniu(val,row){
			return "<a target='_blank' href='${pageContext.request.contextPath}/blog/articles/"+row.id+".html'>"+'更改'+"</a>";
		}
		
	function formatProPic(val,row){
		return "<img width=100 height=100 src='${pageContext.request.contextPath}/static/images/"+val+"'>";
	}
	
	function searchBlog(){
		$("#dg").datagrid('load',{
			"title":$("#s_title").val()
		});
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
	function saveType(){
		$("#fm").form("submit",{
			url:"${pageContext.request.contextPath}/type/add.do",
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
	function closeProductDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	function resetValue(){
		$("#name").val("");
		$("#number").val("");
	}
	function openProductAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加类别信息");
		url="${pageContext.request.contextPath}/type/add.do";
	}
	 function openTypeModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑图书信息");
		$("#id").val(row.id);
		$("#name").val(row.name);
		$("#number").val(row.number);
	}
	
	function openBlogModifyTab(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一个要修改的类别！");
			return;
		}
		var row=selectedRows[0];
		window.parent.openTab('修改类别','modifyBlog.jsp?id='+row.id,'icon-writeblog');
	}
</script>
</head>
<body style="margin: 1px">

<table id="dg" title="图书管理" class="easyui-datagrid" 
  fitColumns="true" pagination="true" rownumbers="true"
  url="${pageContext.request.contextPath}/type/list.do" fit="true" toolbar="#tb">
  <thead>
  	<tr>
  		<th field="cb" checkbox="true" align="center"></th>
  		<th field="id" width="20" align="center">ID</th>
  		<th field="name" width="20" align="center" >类名</th>
  		<th field="number" width="20" align="center">数量</th>
  		<th field="anniu" width="10" align="center" formatter="formatanniu">按钮</th>
  	</tr>
  </thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openProductAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:openTypeModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">更改</a>
		<a href="javascript:deleteBook()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>
<div id="dlg" class="easyui-dialog" style="width: 600px;height:200px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/type/update.do"">
	 		<table cellspacing="8px">
	 			<tr>
	 				
	 				<td colspan="4"><input type="hidden" id="id" name="id" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>类名：</td>
	 				<td colspan="4"><input type="text" id="name" name="name" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>
	 			<tr>
	 				<td>数量：</td>
	 				<td colspan="4"><input type="text" id="number" name="number" class="easyui-validatebox" required="true" style="width: 300px"/></td>
	 			</tr>

	 		</table>
	 		
	 	</form>
	 	<a href="javascript:saveType()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeProductDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
</body>
</html>