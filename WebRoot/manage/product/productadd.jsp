<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
<script language="javascript" type="text/javascript">

function checkform()
{
	 
	

	if (document.getElementById('nameid').value=="")
	{
		alert("商品名不能为空");
		return false;
	}
	
	if (document.getElementById('jiageid').value=="")
	{
		alert("商品价格不能为空");
		return false;
	}
	
	if (document.getElementById('maoshuid').value=="")
	{
		alert("商品介绍不能为空");
		return false;
	}
	
	if (document.getElementById('uploadfileid').value=="")
	{
		alert("商品图片不能为空");
		return false;
	}
	
	return true;
	
}


</script>

</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TR height=28>
    <TD background=images/title_bg1.jpg>当前位置:---》》${title }</TD></TR>
  <TR>
    <TD bgColor=#b1ceef height=1></TD></TR>
  <TR height=20>
    <TD background=images/shadow_bg.jpg></TD></TR></TABLE>
     <form action="${url }" method="post" onsubmit="return checkform()" enctype="multipart/form-data">
<TABLE cellSpacing=0 cellPadding=0 width="60%" align=center border=1>
  	
  	<TR height=>
    <TD align="center" >商品名:</TD>
    <TD align="center"> 
    <input  type="text" name="name"  id='nameid'  size="30"  /><span style="color: red;">*</span>
 
    </TD>
    </TR>
    
    	<TR height=>
    <TD align="center" >商品分类:</TD>
    <TD align="center"> 
    <select name="classify">
       <c:forEach items="${classifylist}" var="bean">
       <option value="${bean.id }"  >${bean.name }</option>
       </c:forEach>
    </select><span style="color: red;">*</span>
 
    </TD>
    </TR>
    	<TR height=>
    <TD align="center" >商品价格:</TD>
    <TD align="center"> 
    <input  type="text" name="jiage"  id='jiageid'  size="30"  /><span style="color: red;">*</span>
 
    </TD>
    </TR>
    
    <TR height=>
    <TD align="center" >商品介绍:</TD>
    <TD align="center"> 
     <textarea rows="7" cols="50"  name="maoshu"  id="maoshuid"></textarea><span style="color: red;">*</span>
    </TD>
    </TR>
    
    	<TR height=>
    <TD align="center" >商品图片:</TD>
    <TD align="center"> 
   <input type="file" name="uploadfile" size="30" id="uploadfileid"/><span style="color: red;">*</span>
    </TD>
    </TR>
     </TD>
    </TR>
    	

    <TR height=>
    <TD align="center" > 操作：</TD>
    <TD align="center"> 
     <input type="submit" value="提交" style="width: 60px" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input  onclick="javascript:history.go(-1);" style="width: 60px" type="button" value="返回" />
    
    </TD>
    </TR>
    
    </TABLE>
    </form>
 </BODY></HTML>
