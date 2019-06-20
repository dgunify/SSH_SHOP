<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>我的购物车</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="iecss.css" />
<![endif]-->
<script language="javascript" type="text/javascript">

function changenum(id){
		var num = document.getElementById(id+"_num").value;
		var now = new Date(); 
		var t = now.getTime()+''; 
		window.location.href="indexmethod!shopCartupdate?id="+id+"&number="+num+"&t="+t;
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

<!--<form action="${url }" method="post">-->
<!--商品名称：<input name="name" type="text"  value="${name }"/>-->
<!---->
<!--<input type="submit"  value="查询"/>-->
<!---->
<!---->
<!--</form>-->

   	<div class="center_title_bar">${title }</div>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=1>
    	<tr height="30">
    	 <td align="center" >订单号</td>
    	<td align="center" >总价 </td>
    	<td align="center" >收货人</td>
    	<td align="center" >订单状态</td>
    	<td align="center" >生成时间</td>
    	<td align="center" >操作</td>
    	</tr>
    	
    	
    <c:forEach items="${list}" var="bean">
    	  <TR  height="28">
    	<td align="center" >${bean.orderid }</td>
    	<td align="center" >￥${bean.zongjia }</td>
    	<td align="center" >${bean.sjname } </td>
     	<td align="center" >${bean.status }</td>
    	<td align="center" >${fn:substring(bean.createtime,0, 19)}</td>
    	<TD align="center" > 
    	
    <a href="${url2 }update3?id=${bean.id }">查看详情</a> &nbsp; 
    <c:if test="${bean.status=='已处理'}">
     <a href="${url2 }delete?id=${bean.id }" onclick=" return confirm('确定要删除吗?'); ">删除</a> &nbsp; 
     </c:if>
    </TD>
    </TR>
    
    </c:forEach>
       <TR height="25">
    <TD align="center" colspan="21" >${pagerinfo }</TD>

  	
    </TR>
      
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
