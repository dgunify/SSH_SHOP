<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="right_content">
   		 <form action="indexmethod!productlist4" method="post" onsubmit="return checkform()">
        <div class="title_box">商品搜索</div>
        <ul class="left_menu">
         <li class="odd"><br/>
              <input name="name" type="text"  value="${name }" size="25"/><br/><br/>
        &nbsp;&nbsp;&nbsp; <input type="submit"  value="搜索">
        </li>
       
       </form>
      
        </ul>      
     
    
   
         <%
                           	org.springframework.web.context.WebApplicationContext app2 = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
                                                         		               com.yd.dao.ProductDao productDao = (com.yd.dao.ProductDao)app2.getBean("productDao");
                                                         		               List<com.yd.model.Product> list2 = productDao.selectBeanList(0,15," where   deletestatus=0  order by dianjishu desc");
                           %>

     
     
    <div class="title_box">商品点击量排行</div>
    
        <ul class="left_menu">
         <li class="odd">商品名
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		点击数
       
        
      
        </li>
        
        <%
                	for(com.yd.model.Product bean:list2){
                %>
        <li class="odd"></br><a href="indexmethod!productupdate3?id=<%=bean.getId() %>"><%=bean.getName() %>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <%=bean.getDianjishu() %>
        </a>
        
      
        </li>

        <% 
        }
        %>
        
      
        </ul>      
     
    
     
   </div><!-- end of right content -->   
   
   
