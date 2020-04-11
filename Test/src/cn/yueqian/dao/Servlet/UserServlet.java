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
//��UTF-8�����������
request.setCharacterEncoding("utf-8");
//��������UTF-8��Ӧ
response.setCharacterEncoding("utf-8");
//֪ͨ���������UTF-8���������
response.setContentType("text/html;charset=utf-8");


//��ô�������ͻ��˽�����������
String username=request.getParameter("username");
String password=request.getParameter("password");

System.out.println("�û�����:"+username+";����:"+password);
UserDao userDao=new UserDaoImpl();

//��ɱ����û��Ķ���
userDao.save(username, password);
//request.getRequestDispatcher("../index.jsp").forward(request, response);

//�ض���
response.sendRedirect("../servlet/IndexServlet");

}


public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
//�������ύ��ʽ��get,post
//�����get��ʽ����ô����doGet��ִ�У�����Ƿ���post������doPost��ִ��
	
	
//������get������post���󣬶���doGet������ִ�д���
doGet(request,response);

}




}
