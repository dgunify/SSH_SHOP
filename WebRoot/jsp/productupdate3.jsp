<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">

<script language="javascript" type="text/javascript">

function checkform()
{
	 
	

	if (document.getElementById('nameid').value=="")
	{
		alert("分类名不能为空");
		return false;
	}
	
	return true;
	
}


</script>

</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TR height=28>
    <TD background=images/title_bg1.jpg>当前位置:---》》${title }</TD></TR>
  <TR>
    <TD bgColor=#b1ceef height=1></TD></TR>
  <TR height=20>
    <TD background=images/shadow_bg.jpg></TD></TR></TABLE>
     <form action="${url }" method="post" onsubmit="return checkform()">
<TABLE cellSpacing=0 cellPadding=0 width="60%" align=center border=1>
  	
  	<TR height=30>
    <TD align="center" >商品分类:</TD>
    <TD align="center"> 
   ${bean.classify.name  }
 
    </TD>
    </TR>
    
    <TR height=30>
    <TD align="center" >商品名:</TD>
    <TD align="center"> 
    ${bean.name }
 
    </TD>
    </TR>
    
    <TR height=30>
    <TD align="center" >商品价格:</TD>
    <TD align="center"> 
  ${bean.jiage } 
    </TD>
    </TR>
    
    <TR height=30>
    <TD align="center" >商品介绍:</TD>
    <TD align="center"> 
    <textarea rows="8" cols="50" name="maoshu"  id='maoshuid' readonly="readonly">${bean.maoshu }</textarea>

    </TD>
    </TR>
    
    <TR height=30>
    <TD align="center" >商品图片:</TD>
    <TD align="center"> 
    <img src='${ctx}/uploadfile/${bean.imgpath}' width="80" height="100" readonly="readonly" />
    </TD>
    </TR>
    
    <TR height=30>
    <TD align="center" >是否推荐:</TD>
    <TD align="center"> 
   ${bean.tuijian }
 
    </TD>
    </TR>
    
    
     <TR height=30>
    <TD align="center" >商品点击数:</TD>
    <TD align="center"> 
   ${bean.dianjishu }
 
    </TD>
    </TR>
    
     <TR height=30>
    <TD align="center" >商品销量:</TD>
    <TD align="center"> 
     ${bean.xiaoliang }
 
    </TD>
    </TR>
    
     <TR height=30>
    <TD align="center" >添加时间:</TD>
    <TD align="center"> 
   ${fn:substring(bean.createtime,0, 19)}
 
    </TD>
    </TR>
    
     <TR height=30>
    <TD align="center" > 操作：</TD>
    <TD align="center"> 
              <a href="indexmethod!shopCartadd?productid=${bean.id }"><img src="${ctx}/images/shopCart.png" border="0"/></a>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input  onclick="javascript:history.go(-1);" style="width: 60px" type="button" value="返回" />
    
    </TD>
    </TR>
    
    </TABLE>
    </form>
 </BODY></HTML>
