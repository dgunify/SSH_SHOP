<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="left_content">
    <div class="title_box">商品分类</div>
    
       <%
           	org.springframework.web.context.WebApplicationContext app = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
                                            com.yd.dao.ClassifyDao classifyDao = (com.yd.dao.ClassifyDao)app.getBean("classifyDao");
                                            List<com.yd.model.Classify> list = classifyDao.selectBeanList(0,9999," where deletestatus=0 ");
           %>
    
        <ul class="left_menu">
           
   
          <%
                        	for(com.yd.model.Classify bean:list){
                        %>
        <li class="odd"></br><a href="indexmethod!productlist4?classify=<%=bean.getId()%>"><%=bean.getName()%></br></a></li>
        <%
        	}
        %>
        
        
        
       
        </ul> 
        <br/><br/>
         <div class="title_box">网站公告</div>
       <%
       	org.springframework.web.context.WebApplicationContext app3 = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
                            com.yd.dao.NoticeDao noticeDao = (com.yd.dao.NoticeDao)app3.getBean("noticeDao");
                            List<com.yd.model.Notice> list3 = noticeDao.selectBeanList(0,10," where deletestatus=0 ");
       %>
    
      
    
        <ul class="left_menu">
       
        <%
               	for(com.yd.model.Notice bean:list3){
               %>
        <li class="odd"></br><a href="indexmethod!noticeupdate3?id=<%=bean.getId() %>"><%=bean.getBiaoti() %></br></a></li>
        <% 
        }
        %>
        
       
        </ul> 
        
    
   </div><!-- end of left content -->
   
  
