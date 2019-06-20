<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>我的购物车</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="../css/iecss.css" />
<![endif]-->
<script language="javascript" type="text/javascript">

function checkform()
{
	 
	

	if (document.getElementById('sjnameid').value=="")
	{
		alert("收件人姓名不能为空");
		return false;
	}
	
	if (document.getElementById('phoneid').value=="")
	{
		alert("手机号码不能为空");
		return false;
	}
	
	valid = /^0?1[3,5,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;
	
	if(!valid.test(document.getElementById("phoneid").value)){
		
		alert('请输入正确的手机格式');
		return false;
	}
	
	
	if (document.getElementById('addressid').value=="")
	{
		alert("收件地址不能为空");
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

   <form action="${url }" method="post" onsubmit="return checkform()">
   <div class="center_title_bar">${title }</div>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=1>
    	<TR height=>
    <TD align="center" >收件人姓名:</TD>
    <TD align="center"> 
    <input  type="text" name="sjname"  id='sjnameid'  size="30"  /><span style="color: red;">*</span>
 
    </TD>
    </TR>
    
    
    	<TR height=>
    <TD align="center" >手机号码:</TD>
    <TD align="center"> 
    <input  type="text" name="phone"  id='phoneid'  size="30"  /><span style="color: red;">*</span>
      
    </TD>
    </TR>
    
    
    	<TR height=>
    <TD align="center" >收件地址:</TD>
    <TD align="center"> 
     <textarea rows="2" cols="50"  name="address"  id="addressid"></textarea><span style="color: red;">*</span>
    </TD>
    </TR>
    
    
    <TR height=>
    <TD align="center" >备注:</TD>
    <TD align="center"> 
     <textarea rows="7" cols="50"  name="beizhu"  id="beizhuid"></textarea>
    </TD>
    </TR>
    

    <TR height=>
    <TD align="center" > 操作：</TD>
    <TD align="center"> 
     <input type="submit" value="提交" style="width: 60px" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input  onclick="javascript:history.go(-1);" style="width: 60px" type="button" value="返回" />
    
    </TD>
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
