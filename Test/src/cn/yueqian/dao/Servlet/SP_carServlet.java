package cn.yueqian.dao.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yueqian.dao.SP_carDao;
import cn.yueqian.dao.impl.SP_carDaoImpl;

public class SP_carServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String sp_car_id=request.getParameter("id");
		String number=request.getParameter("number");
		String sp_car_user=(String)request.getSession().getAttribute("username");
		System.out.println("用户名："+sp_car_user+",数量"+number+",id=="+sp_car_id);
		SP_carDao sp_carDao=new SP_carDaoImpl();
		if(sp_car_user!=null){
			boolean ac=sp_carDao.findSP_car(sp_car_id, sp_car_user);
			
			if(ac){
				//修改
				sp_carDao.updateSP_car(sp_car_id,number,sp_car_user);
			}
			
			else{
				//添加
				sp_carDao.addSP_car(sp_car_id,sp_car_user,number) ;
				
			}
			response.sendRedirect("../servlet/SP_carInfoServlet");
			
		}else{
			response.sendRedirect("../Login.jsp");
		}

	}

	
}
