package cn.yueqian.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yueqian.dao.SP_carDao;
import cn.yueqian.dao.SP_carInfoDao;
import cn.yueqian.javabean.SP_carinfo;
import cn.yueqian.util.FKJDBCUtil;

public class SP_carInfoDaoImpl implements SP_carInfoDao {

	private static final String request = null;


	public List<SP_carinfo> findCarInfo(String username) {
		// TODO Auto-generated method stub
		
		String sql = "select a.sp_img,a.sp_info,a.old_price,a.new_price,b.number,c.username from sp_info a,sp_car b,users c where c.username=b.sp_car_user and b.sp_car_id=a.id and c.username=?;";
		String info[] = {username};
		
		ResultSet rs = FKJDBCUtil.executeQuery(sql, info);
		List<SP_carinfo> sp_carinfo_list = new ArrayList<SP_carinfo>();
		try {
			while(rs.next()){
				SP_carinfo sp_carinfo = new SP_carinfo();
				sp_carinfo.setSp_img(rs.getString("sp_img"));
				sp_carinfo.setSp_info(rs.getString("sp_info"));
				sp_carinfo.setOld_price(rs.getString("old_price"));
				sp_carinfo.setNew_price(rs.getString("new_price"));
				sp_carinfo.setNumber(rs.getString("number"));
				sp_carinfo.setUsername(rs.getString("username"));
				sp_carinfo_list.add(sp_carinfo);
			}
			
			for (SP_carinfo sp_carinfo : sp_carinfo_list) {
				System.out.println(sp_carinfo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			FKJDBCUtil.close(FKJDBCUtil.getCt(), FKJDBCUtil.getPs(), rs);
		}
		return sp_carinfo_list;
	}
	
	
	public List<SP_carinfo> deleteCarInfo(String username){ 
		

		String sql = "delete a.sp_img,a.sp_info,a.old_price,a.new_price,b.number,c.username from sp_info a,sp_car b,users c where c.username=b.sp_car_user and b.sp_car_id=a.id and c.username=?;";
		String info[] = {username};
		
		ResultSet rs = FKJDBCUtil.executeQuery(sql, info);
		List<SP_carinfo> sp_carinfo_list = new ArrayList<SP_carinfo>();
		try {
			while(rs.next()){
				SP_carinfo sp_carinfo = new SP_carinfo();
				sp_carinfo.setSp_img(rs.getString("sp_img"));
				sp_carinfo.setSp_info(rs.getString("sp_info"));
				sp_carinfo.setOld_price(rs.getString("old_price"));
				sp_carinfo.setNew_price(rs.getString("new_price"));
				sp_carinfo.setNumber(rs.getString("number"));
				sp_carinfo.setUsername(rs.getString("username"));
			    deleteSP_car(sp_carinfo);
			}
			for (SP_carinfo sp_carinfo : sp_carinfo_list) {
				System.out.println(sp_carinfo);
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				FKJDBCUtil.close(FKJDBCUtil.getCt(), FKJDBCUtil.getPs(), rs);
			}
		return sp_carinfo_list;
		
		
	}

	private void deleteSP_car(SP_carinfo sp_carinfo) {
		// TODO Auto-generated method stub

	}
	
	
	
}
