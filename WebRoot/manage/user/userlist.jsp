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

<form action="${url }"  method="post">
用户名：<input name="username" type="text"  value="${username }">
<input type="submit"  value="查询"/>


</form>

<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=1>
  	
  	<TR >
    <TD align="center" >用户名</TD>
    <TD align="center" >密码</TD>
    <TD align="center" >真实姓名</TD>
    <TD align="center" >地址</TD>
    <TD align="center" >电话</TD>
    <TD align="center" >电子邮箱</TD>
    <TD align="center" >qq</TD>
     <TD align="center" >添加时间</TD>
   
    </TR>
    <c:forEach items="${list}"  var="bean">

    <TR >
    <TD align="center" >${bean.username }</TD>
    <TD align="center" >${bean.password }</TD>
    <TD align="center" >${bean.truename }</TD>
    <TD align="center" >${bean.address }</TD>
    <TD align="center" >${bean.phone }</TD>
    <TD align="center" >${bean.email }</TD>
    <TD align="center" >${bean.qq }</TD>
    <TD align="center" >${fn:substring(bean.createtime,0, 19)}</TD>
   
    </TR>
    </c:forEach>
    
    <TR >
    <TD align="center" colspan="21" >${pagerinfo }</TD>

  	
    </TR>
    
    
    </TABLE>

 </BODY></HTML>
