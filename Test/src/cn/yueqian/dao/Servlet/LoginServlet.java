package cn.yueqian.dao.Servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.yueqian.dao.UserDao;
import cn.yueqian.dao.impl.UserDaoImpl;

public class LoginServlet extends HttpServlet {

		public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//�õ��û���������
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			UserDao u_dao=new UserDaoImpl();
			boolean login=u_dao.LoginUsername(username, password);
			
			//jsp:�Ĵ�������
			/*
			 * 1.page:��ǰҳ��--���ݽ����ڵ�ǰҳ����Է���
			 * 2.request:��������
			 * 3.session:���ζԻ�����������û�йرգ��򶼿��Է��ʵ����ݣ������ڷ�������
			 * 4.application:������Ŀ
			 */
			if(login){
				//����½�ɹ����û������浽session��
				HttpSession session = request.getSession();//ʵ����һ��session����
				session.setAttribute("username", username);//����½�ɹ����û������浽session��
				response.sendRedirect("../servlet/IndexServlet");
				
			}else{
				response.sendRedirect("../Login.jsp");
				
			}
			
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);

		
	}

	
	
}
