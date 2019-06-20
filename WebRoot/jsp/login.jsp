<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>购物商城</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="${ctx}/css/iecss.css" />
<![endif]-->

<script type="text/javascript" language="javascript">

function checkform(){
	if(document.getElementById("usernameid").value==""){
		
		alert('用户名不能为空');
		return false;
	}
	

	
	if(document.getElementById("passwordid").value==""){
		
		alert('密码不能为空');
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
   	<div class="center_title_bar">用户登录</div>
    <form action="indexmethod!login" method="post" onsubmit="return checkform()">
    	<table align="center" border="1" cellpadding="5" cellspacing="3" width="100%">
    	<tr>
    	<td>
    	用户名:
    	</td>
    	<td>
    	<input type="text" name="username" size="25" id="usernameid" />
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	密码:
    	</td>
    	<td>
    	<input type="password" name="password" size="25" id="passwordid" />
    	</td>
    	</tr>
    	
    	
    	
    	
    	<tr>
    	<td>
    	操作:
    	</td>
    	<td>
    	<input type="submit" value="登录" />
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
    <a href="${ctx}/manage/login.jsp">管理后台</a>
    </div>
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
