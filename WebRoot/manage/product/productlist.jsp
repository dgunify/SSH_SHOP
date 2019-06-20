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
<a href="${url2 }add"><span style="font-size: 25px;font-weight: bold;">添加新商品</span></a>
商品名：<input name="name" type="text"  value="${name }">

<input type="submit"  value="查询"/>


</form>

<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=1>
  	
  	<TR >
        <td align="center" >商品名</td>
    	<td align="center" >商品分类</td>
    	<td align="center" >商品价格 （元/件）</td>
    	<td align="center" >商品图片</td>
    	<td align="center" >是否推荐</td>
    	<td align="center" >商品点击数</td>
    	<td align="center" >商品销量</td>
    	<td align="center" >发布时间</td>
    	<td align="center" >操作</td>
   
    </TR>
    <c:forEach items="${list}"  var="bean">

    <TR >
    	<td align="center" >${bean.name }</td>
    	<td align="center" >${bean.classify.name }</td>
    	<td align="center" >${bean.jiage } </td>
    	<td align="center" ><img src='<%=basePath %>uploadfile/${bean.imgpath}' width="80" height="100"/></td>
    	<td align="center" >${bean.tuijian }</td>
    	<td align="center" >${bean.dianjishu }</td>
    	<td align="center" >${bean.xiaoliang }</td>
    	<td align="center" >${fn:substring(bean.createtime,0, 19)}</td>
    	<TD > 
    	
    <a href="${url2 }update3?id=${bean.id }">查看</a> &nbsp; 
    	
  	<a href="${url2 }update?id=${bean.id }">修改</a> &nbsp; 

  	<a href="${url2 }delete?id=${bean.id }" onclick=" return confirm('确定要删除吗?'); ">删除</a>
  	
  	<c:if test="${bean.tuijian =='未推荐'}">
   <a href="${url2 }update4?id=${bean.id }" onclick=" return confirm('确定要推荐吗?'); ">推荐</a>
   </c:if>
   <c:if test="${bean.tuijian =='推荐'}">
   <a href="${url2 }update5?id=${bean.id }" onclick=" return confirm('确定要取消推荐吗?'); ">取消推荐</a>
   </c:if>
    </TD>
    </TR>
    </c:forEach>
    
    <TR >
    <TD align="center" colspan="21" >${pagerinfo }</TD>

  	
    </TR>
    
    
    </TABLE>

 </BODY></HTML>
