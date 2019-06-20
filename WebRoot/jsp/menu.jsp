<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/common/taglibs.jsp"%>
<div id="menu_tab">
            <div class="left_menu_corner"></div>
                    <ul class="menu">
                         <li><a href="./" class="nav1">  首页 </a></li>
                         <li class="divider"></li>
                         <li><a href="${ctx}/jsp/register.jsp"  class="nav2">新用户注册</a></li>
                         <li class="divider"></li>
                         <li><a href="indexmethod!shopCartlist"  class="nav3">我的购物车</a></li>
                          <li class="divider"></li>                         
                         <li><a href="indexmethod!ordergoodslist" class="nav5">我的订单</a></li>
                        
                         <li class="divider"></li>
                         <c:if test="${user==null}">
                          <li><a href="${ctx}/jsp/login.jsp" class="nav6">用户登录</a></li>
                         </c:if>
                         <c:if test="${user!=null}">
                          <li><a href="indexmethod!loginout" class="nav6">用户退出</a></li>
                         </c:if>
                    </ul>
             <div class="right_menu_corner"></div>
            </div><!-- end of menu tab -->
