package com.yd.action;




import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.yd.model.Classify;
import com.yd.model.Manage;
import com.yd.model.Notice;
import com.yd.model.OrderGoods;
import com.yd.model.Product;
import com.yd.model.User;
import com.yd.util.Pager;
import com.yd.util.Util;



/**
* @author YD
* @version 1.0
* @Description 管理Action
*/
public class ManageAction extends BaseAction{

	
	private static final long serialVersionUID = 1L;
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 管理员后台登陆
	*/
	public void login() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//加密后
		password = passEncry.getEncPass(password);
		
		Manage bean = manageDao.selectBean(" where username='"+username+"' and password ='"+password+"' ");
		if(bean!=null){
			HttpSession session = request.getSession();
			session.setAttribute("manage", bean);
			//返回
			writer(response,"<script  language='javascript'>alert('登陆成功');window.location.href='index.jsp'; </script>");
		}else{
			//返回
			writer(response,"<script  language='javascript'>alert('用户名或者密码错误');window.location.href='login.jsp'; </script>");
		}
	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description 退出
	*/
	public void loginout() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("manage");
		HttpServletResponse response = ServletActionContext.getResponse();
		//返回
		writer(response,"<script  language='javascript'>alert('退出成功');window.location.href='login.jsp'; </script>");
	}
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 修改密码页面跳转
	*/
	public String changepwd(){
		this.setUrl("user/password.jsp");
		return SUCCESS;
		
	}
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 修改密码
	*/
	public void changepwd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String password1 = request.getParameter("password1");
		password1 = passEncry.getEncPass(password1);
		String password2 = request.getParameter("password2");
		password2 = passEncry.getEncPass(password2);
		HttpSession session = request.getSession();
		Manage user = (Manage)session.getAttribute("manage");
		
		Manage bean = manageDao.selectBean(" where username='"+user.getUsername()+"' and password ='"+password1+"' ");
		if(bean!=null){
			bean.setPassword(password2);
			manageDao.updateBean(bean);
			
			//返回
			writer(response,"<script  language='javascript'>alert('操作成功');</script>");
		}else{
			//返回
			writer(response,"<script  language='javascript'>alert('原密码错误');window.location.href='method!changepwd'; </script>");
		}
		
		
	}
	
	/**
	 * 管理员分类管理
	 */
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 分类信息列表
	*/
	public String classifylist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(name !=null &&!"".equals(name)){
			sb.append(" name like '%"+name+"%' ");
			sb.append(" and ");

			request.setAttribute("name", name);
		}
		
		sb.append(" deletestatus=0 order by id desc ");

		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = classifyDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Classify> list = classifyDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!classifylist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!classifylist");
		request.setAttribute("url2", "method!classify");
		request.setAttribute("title", "分类信息管理");
		this.setUrl("classify/classifylist.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 跳转到添加分类页面
	*/
	public String classifyadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!classifyadd2");
		request.setAttribute("title", "添加分类信息");
		this.setUrl("classify/classifyadd.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 添加分类操作
	*/
	public void classifyadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		Classify bean = new Classify();
		bean.setName(name);
		classifyDao.insertBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!classifylist'; </script>");
		
	}
	
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 删除分类操作
	*/
	public void classifydelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Classify bean =classifyDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		classifyDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!classifylist'; </script>");
		
	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description 跳转到更新分类页面
	*/
	public String classifyupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!classifyupdate2");
		request.setAttribute("title", "修改分类信息");
		String id = request.getParameter("id");
		Classify bean =classifyDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("classify/classifyupdate.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 更新分类操作
	*/
	public void classifyupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		Classify bean =classifyDao.selectBean(" where id= "+id);
		bean.setName(name);
		classifyDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!classifylist'; </script>");
		
	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description 跳转到查看分类页面
	*/
	public String classifyupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();

		request.setAttribute("title", "查看分类信息");
		String id = request.getParameter("id");
		Classify bean =classifyDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("classify/classifyupdate3.jsp");
		return SUCCESS;
	}
	
	/**
	 * 管理员后台商品管理
	 */
	
	 private File uploadfile;
	 public File getUploadfile() {
		return uploadfile;
	 }
	 public void setUploadfile(File uploadfile) {
		this.uploadfile = uploadfile;
	 }
	
	
	/**
	* @return  String
	* @author YD
	* @version 1.0
	* @Description 商品信息列表
	*/
	public String productlist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(name !=null &&!"".equals(name)){
			sb.append(" name like '%"+name+"%' ");
			sb.append(" and ");

			request.setAttribute("name", name);
		}
		
		sb.append(" deletestatus=0 order by id desc ");

		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Product> list = productDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!productlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!productlist");
		request.setAttribute("url2", "method!product");
		request.setAttribute("title", "商品信息管理");
		this.setUrl("product/productlist.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 跳转到添加商品页面
	*/
	public String productadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!productadd2");
		request.setAttribute("url2", "method!product");
		request.setAttribute("classifylist", classifyDao.selectBeanList(0, 9999, " where deletestatus=0"));
		request.setAttribute("title", "添加商品信息");
		this.setUrl("product/productadd.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 添加商品操作
	*/
	public void productadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String classify = request.getParameter("classify");
		String maoshu = request.getParameter("maoshu");
		//上传商品图片
		String savapath = ServletActionContext.getServletContext().getRealPath("/")+"/uploadfile/";
		String time = Util.getTime2();
		String imgpath = time+".jpg";
		File file = new File(savapath+imgpath);
		Util.copyFile(uploadfile, file);
		
		Product bean = new Product();
		bean.setCreatetime(new Date());
		bean.setDeletestatus(0);
		bean.setDianjishu(0);
		bean.setClassify(classifyDao.selectBean(" where id= "+classify));
		bean.setImgpath(imgpath);
		bean.setJiage(Double.parseDouble(jiage));
		bean.setName(name);
		bean.setTuijian("未推荐");
		bean.setXiaoliang(0);
		bean.setMaoshu(maoshu);
		productDao.insertBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description 删除商品操作
	*/
	public void productdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		productDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	

	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 跳转到更新商品页面
	*/
	public String productupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("classifylist", classifyDao.selectBeanList(0, 9999, " where deletestatus=0"));
		request.setAttribute("title", "修改商品信息");
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		request.setAttribute("url", "method!productupdate2");
		this.setUrl("product/productupdate.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 更新商品操作
	*/
	public void productupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String jiage = request.getParameter("jiage");
		String id = request.getParameter("id");
		String maoshu = request.getParameter("maoshu");
		String classify = request.getParameter("classify");
		Product bean =productDao.selectBean(" where id= "+id);
		bean.setClassify(classifyDao.selectBean(" where id= "+classify));
		bean.setJiage(Double.parseDouble(jiage));
		bean.setMaoshu(maoshu);
		bean.setName(name);
		productDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	
	/**
	* @param 
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
		request.setAttribute("bean", bean);
		this.setUrl("product/productupdate3.jsp");
		return SUCCESS;
	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description 推荐商品操作
	*/
	public void productupdate4() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		bean.setTuijian("推荐");
		productDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 取消推荐商品操作
	*/
	public void productupdate5() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Product bean =productDao.selectBean(" where id= "+id);
		bean.setTuijian("未推荐");
		productDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!productlist'; </script>");
		
	}

	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 用户列表
	*/
	public String userlist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(username !=null &&!"".equals(username)){
			sb.append(" username like '%"+username+"%' ");
			sb.append(" and ");

			request.setAttribute("username", username);
		}
		
		sb.append(" deletestatus=0 order by id desc ");

		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = userDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<User> list = userDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!userlist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!userlist");
		request.setAttribute("url2", "method!user");
		request.setAttribute("title", "用户管理");
		this.setUrl("user/userlist.jsp");
		return SUCCESS;
	}
	
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 用户删除操作
	*/
	public void userdelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		User bean =userDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		userDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!userlist'; </script>");
		
	}
	
	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 公告列表
	*/
	public String noticelist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String biaoti = request.getParameter("biaoti");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(biaoti !=null &&!"".equals(biaoti)){
			sb.append(" biaoti like '%"+biaoti+"%' ");
			sb.append(" and ");

			request.setAttribute("biaoti", biaoti);
		}
		
		sb.append(" deletestatus=0 order by id desc ");

		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = noticeDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<Notice> list = noticeDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!noticelist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!noticelist");
		request.setAttribute("url2", "method!notice");
		request.setAttribute("title", "公告管理");
		this.setUrl("notice/noticelist.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 跳转到添加公告页面
	*/
	public String noticeadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!noticeadd2");
		request.setAttribute("title", "添加公告");
		this.setUrl("notice/noticeadd.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 添加公告操作
	*/
	public void noticeadd2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String biaoti = request.getParameter("biaoti");
		String content = request.getParameter("content");
		Notice bean = new Notice();
		bean.setBiaoti(biaoti);
		bean.setContent(content);
		bean.setCreatetime(new Date());
		noticeDao.insertBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!noticelist'; </script>");
		
	}
	
	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 删除公告操作
	*/ 
	public void noticedelete() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		Notice bean =noticeDao.selectBean(" where id= "+id);
		bean.setDeletestatus(1);
		noticeDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!noticelist'; </script>");
		
	}
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 跳转到更新公告页面
	*/
	public String noticeupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!noticeupdate2");
		request.setAttribute("title", "修改公告");
		String id = request.getParameter("id");
		Notice bean =noticeDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("notice/noticeupdate.jsp");
		return SUCCESS;
	}
	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 更新公告操作
	*/
	public void noticeupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String biaoti = request.getParameter("biaoti");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		Notice bean =noticeDao.selectBean(" where id= "+id);
		bean.setBiaoti(biaoti);
		bean.setContent(content);
		noticeDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('提交成功');window.location.href='method!noticelist'; </script>");
		
	}
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 跳转到查看公告页面
	*/
	public String noticeupdate3(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("title", "查看公告");
		String id = request.getParameter("id");
		Notice bean =noticeDao.selectBean(" where id= "+id);
		request.setAttribute("bean", bean);
		this.setUrl("notice/noticeupdate3.jsp");
		return SUCCESS;
	}
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 查看订单列表
	*/
	public String ordergoodslist(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String sjname  = request.getParameter("sjname");
		String orderid = request.getParameter("orderid");
		String status = request.getParameter("status");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if(sjname  !=null &&!"".equals(sjname)){
			sb.append("  sjname like '%"+sjname +"%' ");
			sb.append(" and ");

			request.setAttribute("sjname", sjname );
		}
		
		if(orderid !=null &&!"".equals(orderid)){
			sb.append(" orderid like '%"+orderid+"%' ");
			sb.append(" and ");

			request.setAttribute("orderid", orderid);
		}
		
		
		if(status !=null &&!"".equals(status)){
			sb.append(" status like '%"+status+"%' ");
			sb.append(" and ");

			request.setAttribute("status", status);
		}
		
		sb.append(" 1=1 order by id desc ");

		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if(request.getParameter("pagenum") != null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		long total = orderGoodsDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		List<OrderGoods> list = orderGoodsDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
		request.setAttribute("list", list);
		String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "method!ordergoodslist", "共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("url", "method!ordergoodslist");
		request.setAttribute("url2", "method!ordergoods");
		request.setAttribute("title", "订单管理");
		this.setUrl("ordergoods/ordergoodslist.jsp");
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
		this.setUrl("ordergoods/ordergoodsupdate3.jsp");
		return SUCCESS;
	}
	
	/**
	* @author YD
	* @version 1.0
	* @Description 处理订单的操作
	*/
	public void ordergoodsupdate5() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String id = request.getParameter("id");
		OrderGoods bean =orderGoodsDao.selectBean(" where id= "+id );
		bean.setStatus("已处理");
		orderGoodsDao.updateBean(bean);
		//返回
		writer(response,"<script  language='javascript'>alert('操作成功');window.location.href='method!ordergoodslist'; </script>");
		
	}
}
