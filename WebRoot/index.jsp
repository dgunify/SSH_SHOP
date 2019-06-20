<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.yd.util.Util"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Util.init(request);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>购物商城</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="css/iecss.css" />
<![endif]-->

</head>
<body>

<div id="main_container">
	
	 <%@ include file="jsp/head.jsp" %>
	
    
   <div id="main_content"> 
   
            <%@ include file="jsp/menu.jsp" %>
            
          
    
    
   <%@ include file="jsp/left.jsp" %>
   
   
   <div class="center_content">
   	<div class="center_title_bar">新品推荐
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	<a href="indexmethod!productlist4?shenhe=1">更多</a>
   	</div>
    
    <c:forEach  items="${productlist1}" var="bean">
    
    	<div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href="indexmethod!productupdate3?id=${bean.id }">${bean.name }</a></div>
                 <div class="product_img"><a href="indexmethod!productupdate3?id=${bean.id }"><img  src="<%=basePath%>uploadfile/${bean.imgpath }" width="100" height="100" border="0"/></a></div>
                 <div class="prod_price">商品价格：${bean.jiage } ￥ <span class="price"></span></div>  
                 <div class="prod_price">商品销量：${bean.xiaoliang } <span class="price"></span></div>  
                  <div class="prod_price"><a href="indexmethod!shopCartadd?productid=${bean.id }"><img src="images/shopCart.png" border="1"/></a></div>                        
            </div>
           
        </div>
    
    </c:forEach>
 
     	
 
 
 
 <div class="center_title_bar">店长推荐
 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	<a href="indexmethod!productlist2?shenhe=2">更多</a>
 </div>
 
 
      	<c:forEach  items="${productlist2}" var="bean">
    
    	<div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href="indexmethod!productupdate3?id=${bean.id }">${bean.name }</a></div>
                 <div class="product_img"><a href="indexmethod!productupdate3?id=${bean.id }"><img  src="<%=basePath%>uploadfile/${bean.imgpath }" width="100" height="100" border="0"/></a></div>
                 <div class="prod_price">商品价格：${bean.jiage } ￥ <span class="price"></span></div>  
                 <div class="prod_price">商品销量：${bean.xiaoliang } <span class="price"></span></div>  
                  <div class="prod_price"><span class="price"></span></div> 
                     <div class="prod_price"><a href="indexmethod!shopCartadd?productid=${bean.id }"><img src="images/shopCart.png" border="0"/></a></div>                           
          	
            </div>
                       
        </div>
    
    </c:forEach>
        
   
   </div><!-- end of center content -->
   
   <%@ include file="jsp/right.jsp" %>
   
            
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
