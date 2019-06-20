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
   	<div class="center_title_bar">拍卖管理</div>
   	<form action="${url }" method="post">
&nbsp;&nbsp;&nbsp;&nbsp;
商品名：<input name="name" type="text"  value="${name }">
状态：
<select name="shenhe">
<option value="">所有选项</option>

<option value="拍卖中" <c:if test="${shenhe=='拍卖中' }">selected</c:if> >拍卖中</option>
<option value="拍卖成功" <c:if test="${shenhe=='拍卖成功' }">selected</c:if> >拍卖成功</option>
<option value="流拍" <c:if test="${shenhe=='流拍' }">selected</c:if> >流拍</option>
</select>
<input type="submit"  value="查询"/>


</form>
   	
    <form action="indexmethod!login" method="post" onsubmit="return checkform()">
    	<table align="center" border="1" cellpadding="5" cellspacing="3" width="100%">
    	<tr>
    	<td>商品名</td>
    	<td>商品分类</td>
    	<td>起拍价</td>
    	<td>最高价</td>
    	<td>出价者</td>
    	<td>截止日期</td>
    	<td>发布时间</td>
    	<td>状态</td>
    	<td>操作</td>
    	</tr>
    	
    	
    	<c:forEach items="${list}"  var="bean">
    	<tr>
    	<td>${bean.name }</td>
    	<td>${bean.classify.name }</td>
    	<td>${bean.qipaijia }</td>
    	<td>${bean.zuigaojia }</td>
    	<td>${bean.chujiazhe.username }</td>
    	<td>${bean.jiezhishijian }</td>
    	<td>${fn:substring(bean.createtime,0, 19)}</td>
    	<td>${bean.shenhe }</td>
    	<TD > 
  	<a href="${url2 }update3?id=${bean.id }">查看</a> &nbsp; 
<br/>

    </TD>
    	</tr>
    	</c:forEach>
    	
    	<tr>
    	<td  colspan="9">${pagerinfo }</td>
    
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
