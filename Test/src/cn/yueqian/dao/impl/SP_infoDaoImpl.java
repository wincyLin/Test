package cn.yueqian.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.yueqian.dao.SP_infoDao;
import cn.yueqian.javabean.SP_info;
import cn.yueqian.util.FKJDBCUtil;

public class SP_infoDaoImpl implements SP_infoDao{
	public List<SP_info> getSP_infoList(String type,String sous_info,String id){
		ResultSet rs=null;
		List<SP_info> sp_info_list=new ArrayList<SP_info>();
		
		if(id!=null){
			
			String sql="select * from sp_info where id=?";
			String info[]={id};
			rs=FKJDBCUtil.executeQuery(sql,info);
			try {
				forInfo(rs,sp_info_list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				FKJDBCUtil.close(FKJDBCUtil.getCt(), FKJDBCUtil.getPs(), rs);
				
			}
			
			
		}else{
			
		
		
		
		if(sous_info==null){
			String sql="select * from sp_info";
			rs=FKJDBCUtil.executeQuery(sql,null);
			
			
		}else{
			String sql="select * from sp_info where sp_info like '%"+sous_info+"%' and sp_type='"+type+"'";
			System.out.println("sql=="+sql);
			rs=FKJDBCUtil.executeQuery(sql,null);
		}
	
			
		try {
		
			forInfo(rs,sp_info_list);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			FKJDBCUtil.close(FKJDBCUtil.getCt(), FKJDBCUtil.getPs(), rs);
			
		}
		}
	
		for (SP_info sp_info:sp_info_list){
			System.out.println(sp_info);
		
		}
	
		return sp_info_list;	
	}
	//封装一个遍历数据
	public void forInfo(ResultSet rs,List<SP_info> sp_info_list) throws SQLException{
		while(rs.next()){
			SP_info sp_info=new SP_info();
			
			sp_info.setId(rs.getInt("id"));
			sp_info.setSp_type(rs.getInt("sp_type"));
			sp_info.setSp_name(rs.getString("sp_name"));
			sp_info.setOld_price(rs.getString("old_price"));
			sp_info.setNew_price(rs.getString("new_price"));
			sp_info.setSp_info(rs.getString("sp_info"));
			sp_info.setSp_img(rs.getString("sp_img"));
			sp_info_list.add(sp_info);	
		}
		
	}

}
