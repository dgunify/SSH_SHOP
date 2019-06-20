<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TR height=28>
    <TD background=images/title_bg1.jpg>当前位置:---》》${title }</TD></TR>
  <TR>
    <TD bgColor=#b1ceef height=1></TD></TR>
  <TR height=20>
    <TD background=images/shadow_bg.jpg></TD></TR></TABLE>

<form action="${url }" method="post">
购买用户：<input name="sjname" type="text"  value="${sjname }"/>
订单号：<input name="orderid" type="text"  value="${orderid }"/>
订单状态：
	<select name="status">
		<option value="" >全部</option>
		<option value="已处理" <c:if test="${status =='已处理' }">selected</c:if>>已处理</option>
		<option value="未处理" <c:if test="${status =='未处理' }">selected</c:if>>未处理</option>
	</select>
<input type="submit"  value="查询"/>


</form>

<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=1>
  	
  	<TR >
        <td align="center" >订单号</td>
    	<td align="center" >总价 （元）</td>
    	<td align="center" >购买用户</td>
    	<td align="center" >订单状态</td>
    	<td align="center" >订单生成时间</td>
    	<td align="center" >操作</td>
   
    </TR>
    <c:forEach items="${list}"  var="bean">

    <TR >
    	<td align="center" >${bean.orderid }</td>
    	<td align="center" >￥${bean.zongjia }</td>
    	<td align="center" >${bean.sjname }</td>
     	<td align="center" >${bean.status }</td>
    	<td align="center" >${fn:substring(bean.createtime,0, 19)}</td>
    	<TD align="center" > 
    	
    <a href="${url2 }update3?id=${bean.id }">查看</a> &nbsp; 
    
   <c:if test="${bean.status =='未处理'}">
   <a href="${url2 }update5?id=${bean.id }" onclick=" return confirm('确定要处理订单吗?'); ">处理订单</a>
   </c:if>
    </TD>
    </TR>
    </c:forEach>
    
    <TR >
    <TD align="center" colspan="21" >${pagerinfo }</TD>

  	
    </TR>
    
    
    </TABLE>

 </BODY></HTML>
