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
 	<div class="center_title_bar">${title }</div>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=1>
    	<TR height=30>
    <TD align="center" >收件人姓名:</TD>
    <TD align="center"> 
   ${bean.sjname  }
 
    </TD>
    </TR>
    
    <TR height=30>
    <TD align="center" >收件地址:</TD>
    <TD align="center"> 
    ${bean.address }
 
    </TD>
    </TR>
    
    <TR height=30>
    <TD align="center" >联系电话:</TD>
    <TD align="center"> 
  ${bean.phone } 
    </TD>
    </TR>
    
    <TR height=30>
    <TD align="center" >订单状态:</TD>
    <TD align="center"> 
    ${bean.status }

    </TD>
    </TR>
    
    <TR height=30>
    <TD align="center" >订单生成时间:</TD>
    <TD align="center"> 
     ${fn:substring(bean.createtime,0, 19)}
    </TD>
    </TR>
    
    
    <TR height=30>
    <TD align="center" >订单明细:</TD>
    <TD align="center"> 
    ${bean.xiangqing }
    </TD>
    </TR>
    
     <TR height=30>
    <TD align="center" >总价:</TD>
    <TD align="center"> 
   
     ￥${bean.zongjia }
    
    </TD>
    </TR>
    
    
     <TR height=30>
    <TD align="center" >备注:</TD>
    <TD align="center"> 
    <textarea rows="3" cols="50" name="beizhu"  id='beizhuid' readonly="readonly">${bean.beizhu }</textarea>

    </TD>
    </TR>
    
     <TR height=30>
    <TD align="center" > 操作：</TD>
    <TD align="center"> 

				<input  onclick="javascript:history.go(-1);" style="width: 60px" type="button" value="返回" />
    
    </TD>
    </TR>
    
    	</table>

    	
    
    
   
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
