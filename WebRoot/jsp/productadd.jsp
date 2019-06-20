<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>购物商城</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="iecss.css" />
<![endif]-->

<script type="text/javascript" language="javascript">

function checkform(){
	if(document.getElementById("nameid").value==""){
		
		alert('商品名不能为空');
		return false;
	}
	
	if(document.getElementById("uploadfileid").value==""){
		
		alert('商品图片不能为空');
		return false;
	}
	
	if(document.getElementById("qipaijiaid").value==""){
		
		alert('起拍价不能为空');
		return false;
	}
	
	
	 
 	var reg1 =  /^\d+$/;
	 
	

	if (document.getElementById('qipaijiaid').value.match(reg1) == null)
	{
		alert("起拍价必须为正整数");
		return false;
	}
	
	
	
	return true;

}


</script>

</head>
<body>

<div id="main_container">
	
		<%@ include file="head.jsp" %>
    
   <div id="main_content"> 
   
            <%@ include file="menu.jsp" %>
            
          
    
    
   <%@ include file="left.jsp" %>
   
   
   <div class="center_content">
   	<div class="center_title_bar">发布拍卖的商品</div>
    <form action="${url }" method="post" onsubmit="return checkform() " enctype="multipart/form-data" >
    	<table align="center" border="1" cellpadding="5" cellspacing="3" width="100%">
    	<tr>
    	<td>
    	 商品名：
    	</td>
    	<td>
    	 <input type="text" name="name" size="35" id="nameid"/>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	 商品分类：
    	</td>
    	<td>
    	 <select name="classify">
<c:forEach items="${classifylist}" var="bean">
<option value="${bean.id }"  >${bean.name }</option>
</c:forEach>
</select>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	 商品图片：
    	</td>
    	<td>
    	<input type="file" name="uploadfile" size="35" id="uploadfileid"/>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	 简介：
    	</td>
    	<td>
    	 <textarea rows="7" cols="50"  name="info"  id="infoid"></textarea>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	起拍价:
    	</td>
    	<td>
    	<input type="text" name="qipaijia" size="35" id="qipaijiaid" />
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	拍卖有效期:
    	</td>
    	<td>
    	<select name="youxiaoqi">
    	<option value="1">1天</option>
    	<option value="3">3天</option>
    	<option value="5">5天</option>
    	<option value="10">10天</option>
    	<option value="15">15天</option>
    	<option value="30">30天</option>
    	</select>
    	</td>
    	</tr>
    	
    	
    	
    	
    	<tr>
    	<td>
    	操作:
    	</td>
    	<td>
    	<input type="submit" value="发布" />
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<input type="reset" value="重置" />
    	</td>
    	</tr>
    	
    	
    	
    	
    	</table>
    	
    	</form>
    	
    
    
 
     	
 
     	
 
 
 
 
 
     	
 
 
 
 
    
    
   
   </div><!-- end of center content -->
   
   <%@ include file="right.jsp" %>
   
            
   </div><!-- end of main content -->
   
   
   
   <div class="footer">
   
 <br/>
       联系我们：XXXXX
       
      
       <br/> <br/>
       地址：XXXX
       <div align="right">
    <a href="manage/login.jsp">管理后台</a>
    </div>
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
