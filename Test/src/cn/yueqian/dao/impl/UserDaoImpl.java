package cn.yueqian.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.yueqian.dao.UserDao;
import cn.yueqian.util.FKJDBCUtil;

public class UserDaoImpl implements UserDao {
	public void save(String username,String password){
		String sql="insert ignore into users( username,password)values(?,?)";
		String info[]={username,password};
		FKJDBCUtil.executeUpdate(sql, info);
		
	}
	
	public boolean findByUsername(String username){
		ResultSet rs=null;
		try {
		String sql="select * from users where username=?";
		String info[]={username,};
		rs = FKJDBCUtil.executeQuery(sql, info);
			if(rs.next()){
				return false;
			}else{
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			FKJDBCUtil.close(FKJDBCUtil.getCt(), FKJDBCUtil.getPs(),rs);
		}
		return false;	
	}
	
	 public boolean LoginUsername(String username,String password){
		 //ע�⣺�����û���½��ʱ��Ҫ�������ݿ�©������������
		 //���ܣ����û���������ȥ���ݿ����ѯ
		 //�ܣ����û��������ݿ�ȥ��ѯ����ѯ�󷵻����룬�ٽ����ص��������û�������������Ƚ�
		 String sql="select password from users where username=?";
		 String info[]={username};
		 ResultSet rs = FKJDBCUtil.executeQuery(sql, info);
		 String password2=null;
		 boolean login=false;
		 try {
			if(rs.next()){
				password2=rs.getString("password");
				if(password2.equals(password)){
				System.out.println("�û���½�ɹ�����");	
				login=true;
				}else{
					System.out.println("������󣡣�");
				}
				
			}else{
				System.out.println("�û������ڣ���");
			}
			 
			 
			 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			FKJDBCUtil.close(FKJDBCUtil.getCt(), FKJDBCUtil.getPs(),rs);
			
		}
		return login;
		
	}
	 
	

}
