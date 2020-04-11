package cn.yueqian.dao.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yueqian.dao.UserDao;
import cn.yueqian.dao.impl.UserDaoImpl;

public class UserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
//以UTF-8编码接收数据
request.setCharacterEncoding("utf-8");
//将数据以UTF-8响应
response.setCharacterEncoding("utf-8");
//通知浏览器，以UTF-8编码打开数据
response.setContentType("text/html;charset=utf-8");


//获得从浏览器客户端交过来的数据
String username=request.getParameter("username");
String password=request.getParameter("password");

System.out.println("用户名是:"+username+";密码:"+password);
UserDao userDao=new UserDaoImpl();

//完成保存用户的动作
userDao.save(username, password);
//request.getRequestDispatcher("../index.jsp").forward(request, response);

//重定向
response.sendRedirect("../servlet/IndexServlet");

}


public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
//有两种提交方式：get,post
//如果是get方式：那么就在doGet中执行；如果是方法post，则在doPost中执行
	
	
//不管是get请求还是post请求，都在doGet方法中执行代码
doGet(request,response);

}




}
