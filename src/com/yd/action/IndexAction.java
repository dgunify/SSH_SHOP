package com.yd.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.yd.model.Notice;
import com.yd.model.OrderGoods;
import com.yd.model.Product;
import com.yd.model.ShopCart;
import com.yd.model.User;
import com.yd.service.IndexService;
import com.yd.service.impl.IndexServiceImpl;
import com.yd.util.ColumnUtil;
import com.yd.util.Pager;

/**
* @author YD
* @version 1.0
* @Description 主Action
*/
public class IndexAction extends BaseAction {
 
	private static final long serialVersionUID = 1L;
	IndexService indexService = new IndexServiceImpl();

	/**
	* @param String success
	* @author YD
	* @version 1.0
	* @Description 首页  查询最新商品
	*/
	public  String  index(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Product> listOne = indexService.getProductBySql(productDao," where deletestatus=0 order by id desc ");//新品推荐
		List<Product> listTow = indexService.getProductBySql(productDao," where deletestatus=0 and tuijian='推荐' order by id desc ");//店长推荐

		
		request.setAttribute("productlist1", listOne);
		request.setAttribute("productlist2", listTow);
		return "success";
		
	}

	/**
	* @author YD
	* @version 1.0
	* @throws Exception 
	* @Description 用户注册
	*/
	public void register() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		//特色代码，模仿底层使用反射封装对象
		User bean = (User) ColumnUtil.parseRequestToEntity(request,getClass().getClassLoader().loadClass("com.yd.model.User"));
		//密码加密
		bean.setPassword(passEncry.getEncPass(bean.getPassword()));
		
		boolean flag = indexService.register(userDao,bean);
		
		if (flag) {
			//返回
			writer(response,"<script  language='javascript'>alert('注册成功');window.location.href='"+getCtx()+"/jsp/login.jsp'; </script>");
		} else {
			//返回
			writer(response,"<script  language='javascript'>alert('用户名已经存在，注册失败！');window.location.href='"+getCtx()+"/jsp/register.jsp'; </script>");
		}

	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description 用户登录
	*/
	public void login() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		password = passEncry.getEncPass(password);//加密后
		User bean = userDao.selectBean("  where deletestatus=0 and username='"
				+ username + "' and password='" + password + "'");
		if (bean != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", bean);
			//返回
			writer(response,"<script  language='javascript'>alert('登录成功！');window.location.href='index'; </script>");
		} else {
			//返回
			writer(response,"<script  language='javascript'>alert('用户名或者密码错误！登录失败');window.location.href='"+getCtx()+"/jsp/login.jsp'; </script>");
		}

	}

	/**
	* @author YD
	* @version 1.0
	* @Description 用户退出
	*/
	public void loginout() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		//返回
		writer(response,"<script  language='javascript'>alert('退出成功！');window.location.href='"+getCtx()+"/index.jsp'; </script>");

	}
	
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 按类型查看商品列表
	*/
	public String productlist2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();

		String name = request.getParameter("name");
		String classify = request.getParameter("classify");
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(name !=null &&!"".equals(name)){
			sb.append(" name like '%"+name+"%' ");
			sb.append(" and ");

			request.setAttribute("name", name);
		}
		
		if(classify !=null &&!"".equals(classify)){
			
			
			sb.append(" classify.id= "+classify+" ");
			sb.append(" and ");

			request.setAttribute("classify", classify);
		}
		
		sb.append(" deletestatus=0 and tuijian='推荐' order by id desc  ");

		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Product> list = productDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!productlist2", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "indexmethod!productlist2");
		request.setAttribute("url2", "indexmethod!product");
		request.setAttribute("title", "商品信息管理");
		request.setAttribute("classifylist", classifyDao.selectBeanList(0, 9999, " where deletestatus=0"));
		this.setUrl(""+getCtx()+"/jsp/productlist2.jsp");
		return SUCCESS;
	}
	

	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 按类型查看商品列表
	*/
	public String productlist4() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();

		String name = request.getParameter("name");
		String classify = request.getParameter("classify");
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(name !=null &&!"".equals(name)){
			sb.append(" name like '%"+name+"%' ");
			sb.append(" and ");
			request.setAttribute("name", name);
		}
		
		if(classify !=null &&!"".equals(classify)){
			sb.append(" classify.id= "+classify+" ");
			sb.append(" and ");
			request.setAttribute("classify", classify);
		}
		sb.append(" deletestatus=0  order by id desc ");

		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Product> list = productDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!productlist4", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "indexmethod!productlist4");
		request.setAttribute("url2", "indexmethod!product");
		request.setAttribute("title", "商品信息管理");
		request.setAttribute("classifylist", classifyDao.selectBeanList(0, 9999, " where deletestatus=0"));
		this.setUrl(""+getCtx()+"/jsp/productlist4.jsp");
		return SUCCESS;
	}
	

	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 跳转到查看商品页面
	*/
	public String productupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "查看商品信息");
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		bean.setDianjishu(bean.getDianjishu()+1);
		productDao.updateBean(bean);
		request.setAttribute("bean", bean);
		this.setUrl(""+getCtx()+"/jsp/productupdate3.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 跳转到查看公告页面
	*/
	public String noticeupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "查看公告信息");
		String id = request.getParameter("id");
		Notice bean =noticeDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl(""+getCtx()+"/jsp/noticeupdate3.jsp");
		return SUCCESS;
	}
	

	/**
	* @author YD
	* @version 1.0
	* @Description 添加商品到购物车
	*/
	public void  shopCartadd() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
		
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			//返回
			writer(response,"<script  language='javascript'>alert('请先登录');" +
							"window.location.href='"+getCtx()+"/index.jsp'; </script>");
			return  ;
		}
		Product product = productDao.selectBean(" where id= "+request.getParameter("productid"));
		ShopCart bean  = shopCartDao.selectBean(" where user.id= "+user.getId()+" and product.id= "+product.getId()+"and deletestatus=0");
		if(bean!=null){
			//返回
			writer(response,"<script  language='javascript'>alert('该商品已经添加到购物车，请勿重复添加');" +
							"window.location.href='"+getCtx()+"/index.jsp'; </script>");
			return  ;
		}
		bean = new ShopCart();
		bean.setCreatetime(new Date());
		bean.setNumber(1);
		bean.setProduct(product);
		bean.setUser(user);
		shopCartDao.insertBean(bean);
		
		//返回
		writer(response,"<script  language='javascript'>alert('添加成功');" +
						"window.location.href='indexmethod!shopCartlist'; </script>");
			
		
		
	}
	
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 购物车列表
	*/
	public String  shopCartlist() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			//返回
			writer(response,"<script  language='javascript'>alert('请先登录');window.location.href='"+getCtx()+"/index.jsp'; </script>");
			return null ;
		}
		List<ShopCart> list = shopCartDao.selectBeanList(0, 9999, " where user.id= "+user.getId()+" and deletestatus=0");
		double zongjia = 0;
		for(ShopCart bean:list){
			double jiage1 = bean.getNumber()*bean.getProduct().getJiage();
			zongjia  = zongjia + jiage1;
		}
		request.setAttribute("zongjia", zongjia);
		request.setAttribute("list", list);
		request.setAttribute("title", "购物车列表");
		this.setUrl(""+getCtx()+"/jsp/shopCartlist.jsp");
		return SUCCESS;
	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description 修改购物车的商品数量的操作
	*/
	public void shopCartupdate() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String number = request.getParameter("number");
		ShopCart shopCart = shopCartDao.selectBean(" where id= "+request.getParameter("id"));
		shopCart.setNumber(Integer.parseInt(number));
		shopCartDao.updateBean(shopCart);
		PrintWriter writer = response.getWriter();
		writer.print("<script  language='javascript'>alert('操作成功');" +"window.location.href='indexmethod!shopCartlist'; </script>");
			
		
	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description  删除购物车商品的操作
	*/
	public void shopCartdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		ShopCart shopCart = shopCartDao.selectBean(" where id= "+request.getParameter("id"));
	    shopCartDao.deleteBean(shopCart);
	    //返回
		writer(response,"<script  language='javascript'>alert('删除成功');" +
						"window.location.href='indexmethod!shopCartlist'; </script>");
			
		
	}

	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 跳转到客户填写收件信息页面
	*/
	public String ordergoodsadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "填写订单信息");
		request.setAttribute("url", "indexmethod!ordergoodsadd2");
		this.setUrl(""+getCtx()+"/jsp/ordergoodsadd.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 添加订单操作
	*/
	public void ordergoodsadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String address = request.getParameter("address");
		String beizhu = request.getParameter("beizhu");
		String phone = request.getParameter("phone");
		String sjname = request.getParameter("sjname");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		OrderGoods bean = new OrderGoods();
		bean.setAddress(address);
		bean.setBeizhu(beizhu);
		bean.setCreatetime(new Date());
	    bean.setDeletestatus(0);
		bean.setOrderid(new Date().getTime()+"");
		bean.setPhone(phone);
		bean.setSjname(sjname);
		bean.setStatus("未处理");
		bean.setUser(user);
		
		List<ShopCart> list = shopCartDao.selectBeanList(0, 9999, " where user.id="+user.getId()+" and deletestatus=0");
		StringBuffer sb = new StringBuffer();
		double zongjia = 0;
		for(ShopCart g:list){
			sb.append(" 商品名： "+g.getProduct().getName() +",购买数量:"+g.getNumber()  +",单价"+g.getProduct().getJiage()  
					+",￥小计"+ (g.getNumber()*g.getProduct().getJiage()) );
			g.setDeletestatus(1);
			Product product = g.getProduct();
			product.setXiaoliang(g.getProduct().getXiaoliang()+g.getNumber());
			productDao.updateBean(product);
			shopCartDao.updateBean(g);
			
			zongjia = zongjia+(g.getNumber()*g.getProduct().getJiage());
		}
		bean.setXiangqing(sb.toString());
		bean.setZongjia(zongjia);
		orderGoodsDao.insertBean(bean);
		
		//返回
		writer(response,"<script  language='javascript'>alert('操作成功');window.location.href='indexmethod!ordergoodslist'; </script>");
		
	}
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 查看订单列表
	*/
	public String ordergoodslist() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			//返回
			writer(response,"<script  language='javascript'>alert('请先登录');window.location.href='"+getCtx()+"/index.jsp'; </script>");
			return null ;
		}
		String name = request.getParameter("name");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		if(name !=null &&!"".equals(name)){
			sb.append(" shopCart.product.name like '%"+name+"%' ");
			sb.append(" and ");
			request.setAttribute("name", name);
		}

		sb.append(" user.id="+user.getId()+" and deletestatus=0 order by id desc ");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = orderGoodsDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<OrderGoods> list = orderGoodsDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!ordergoodslist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
	
		request.setAttribute("list", list);
		request.setAttribute("url", "indexmethod!ordergoodslist");
		request.setAttribute("url2", "indexmethod!ordergoods");
		request.setAttribute("title", "订单列表");
		this.setUrl(""+getCtx()+"/jsp/ordergoodslist.jsp");
		return SUCCESS;
	}
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 跳转到订单详细信息页面
	*/
	public String ordergoodsupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "查看订单详细信息");
		String id = request.getParameter("id");
		OrderGoods bean =orderGoodsDao.selectBean(" where id= "+id );
		request.setAttribute("bean", bean);
		this.setUrl(""+getCtx()+"/jsp/ordergoodsupdate3.jsp");
		return SUCCESS;
	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description 删除订单的操作
	*/
	public void ordergoodsdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		request.setAttribute("url","indexmethod!ordergoodsdelete");
		OrderGoods ordergoods = orderGoodsDao.selectBean(" where id= "+request.getParameter("id"));
	    ordergoods.setDeletestatus(1);
	    orderGoodsDao.updateBean(ordergoods);
	    //返回
		writer(response,"<script  language='javascript'>alert('删除成功');" +
						"window.location.href='indexmethod!ordergoodslist'; </script>");
			
	}
	
}
