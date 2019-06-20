<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script>  
 function changeClock()  
 {  
     var d = new Date();  
     document.getElementById("clock").innerHTML = 
     
    "时间："+
     d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();  
 }  
 window.setInterval(changeClock, 1000);  
</script>

<div class="top_bar">
	<br/>
    	<span style="font-size: 15px;font-weight: bold;color: white;">欢迎${user.truename }光临购物商城</span>
        
        
<div align="right" id="clock" style="font-size: 15px;font-weight: bold;color: white;margin-top: -20px;" ></div>
    
    </div>
	<div id="header">
        
        <div id="logo">
            <a href="index.html"><img src="${ctx}/images/shoppingcart.png" alt="" title="" border="0" width="200" height="140" /></a>
	    </div>
        
        <div class="oferte_content">
        <br/><br/><br/>
        <span style="font-size: 70px;font-weight: bold;color: #FF6600;">
        购&nbsp;&nbsp;&nbsp;物&nbsp;&nbsp;&nbsp;商&nbsp;&nbsp;&nbsp;城
        </span>	
        </div> <!-- end of oferte_content-->
        

    </div>
