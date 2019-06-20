<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/common/taglibs.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>购物商城</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="iecss.css" />
<![endif]-->



</head>
<body>

<div id="main_container">
	
		<%@ include file="head.jsp" %>
    
   <div id="main_content"> 
   
            <%@ include file="menu.jsp" %>
            
          
    
    
   <%@ include file="left.jsp" %>
   
   
   <div class="center_content">
   	<div class="center_title_bar">商品信息查询</div>
   	
   	
    <form action="${url }" method="post" onsubmit="return checkform()">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                  商品名：<input name="name" type="text"  value="${name }"/>
          商品分类：
              <select name="classify">
                   <option value="" >全部</option>
                 <c:forEach items="${classifylist}"  var="bean2">
                    <option value="${bean2.id }" <c:if test="${classify== bean2.id }">selected</c:if>>${bean2.name }</option>
                 </c:forEach>
              </select>

               <input type="submit"  value="查询"/>
    	<table align="center" border="1" cellpadding="5" cellspacing="3" width="100%">
    	<tr>
    	<td align="center" >商品名</td>
    	<td align="center" >商品分类</td>
    	<td align="center" >商品价格 </td>
    	<td align="center" >商品图片</td>
    	<td align="center" >商品销量</td>
    	<td align="center" >操作</td>
    	</tr>
    	
    	
    	<c:forEach items="${list}"  var="bean">
    	<tr>
    	<td align="center" >${bean.name }</td>
    	<td align="center" >${bean.classify.name }</td>
    	<td align="center" >${bean.jiage }￥ </td>
    	<td align="center" ><img src='${ctx}uploadfile/${bean.imgpath}' width="80" height="100"/></td>
    	<td align="center" >${bean.xiaoliang }</td>
    	<td align="center" >
    		<a href="${url2 }update3?id=${bean.id }">查看</a>
    	</td>
    	</tr>
    	</c:forEach>
    	
    	<tr>
    	<td  colspan="8" align=center >${pagerinfo }</td>
    
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
