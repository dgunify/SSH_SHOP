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
		var reg1 =  /^\d+$/;
	if (num.match(reg1) == null)
	{
		alert("购买数量必须为正整数");
		return false;
	}
		if (num == 0 )
	{
		alert("购买数量必须大于0的正整数");
		return false;
	}
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
 	<div class="center_title_bar">${title }</div>
   <form action="indexmethod!shopCartlist?id=${bean.id }"method="post" onsubmit="return checkform()">
    	<table align="center" border="1" cellpadding="5" cellspacing="3" width="100%">
    	<tr>
    	<td  align="center" >商品名</td>
    	<td  align="center" >商品价格</td>
    	<td  align="center" >购买数量</td>
    	<td  align="center" >小计</td>
    	<td  align="center" >操作</td>
    	</tr>
    	
    	
    <c:forEach items="${list}" var="bean">
    	<tr>
    	<td  align="center" >${bean.product.name }</td>
    	<td  align="center" >￥${bean.product.jiage}</td>
    	<td  align="center" >
    	<input type="text" name="number"  value="${bean.number }" id="${bean.id }_num"  size="5"/>&nbsp;
    	<a href="javascript:;"  onclick="changenum(${bean.id })">变更</a> &nbsp;</td>
    	<td  align="center" >￥${bean.product.jiage * bean.number}</td>
    	<td align="center">
  	 
<br/>
  	<a href="indexmethod!shopCartdelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?'); ">删除</a>
 
    </td>
    	</tr>
    </c:forEach>
       
       <table align="center" border="0" cellpadding="5" cellspacing="3" width="100%" >
    	<tr>
    	<td  align="right" hight="66" >总计：￥${zongjia }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="indexmethod!ordergoodsadd?id=${bean.id }" >结算，生成订单</a></td>
    	</tr>

    	</table>
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
