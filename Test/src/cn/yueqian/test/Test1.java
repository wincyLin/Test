package cn.yueqian.test;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.yueqian.javabean.Users;
import cn.yueqian.util.FKJDBCUtil;

public class Test1 {
	public static void main(String[] args){
		//test1();
		//test2();
		//test3();
		//test4();
		test5();

}
	public static void test1(){//��ѯ����
		ResultSet rs=null;
		try{
			String sql="select * from users";
			
			
		    rs= FKJDBCUtil.executeQuery(sql, null);//�Է��صĽ�����в���
			List<Users> list_users=new ArrayList<Users>();
		
				while(rs.next()){
					Users user=new Users();
					user.setId(rs.getInt("id"));
					user.setPassword(rs.getString("username"));
					user.setUsername(rs.getString("password"));
					list_users.add(user);
					
					rs.getInt("id");
					System.out.println(rs.getInt("id")+","+rs.getString("username")+","+rs.getString("password"));
				}
			for(Users users:list_users){
					System.out.println(users);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				FKJDBCUtil.close(FKJDBCUtil.getCt(), FKJDBCUtil.getPs(), rs);
			}
	}
	public static void test2(){//�鿴����
		ResultSet rs = null;
		try {
			String sql = "select * from users where id=?";
			String info[] ={"2"};
		    rs =FKJDBCUtil.executeQuery(sql,info);
			List<Users> list_users = new ArrayList<Users>();
			//6.�Է��ؽ�����в���
			while(rs.next()){
				//�����ݿ���ȡ��������ӳ�䵽users������
				Users user = new Users();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setUsername(rs.getString("password"));
				System.out.println(rs.getInt("id")+","+rs.getString("username")+","+rs.getString("password"));
				list_users.add(user);
			}
			for(Users users:list_users){
				//System.out.println(users);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			FKJDBCUtil.close(FKJDBCUtil.getCt(), FKJDBCUtil.getPs(), rs);
		}
	}
	public static void test3(){//��������
		String sql ="INSERT INTO users(username,PASSWORD)VALUES(?,?)";
		String info[] ={"wangwu","cccccc"};
		FKJDBCUtil.executeUpdate(sql, info);
	}
	public static void test4(){//��������
		String sql ="update users set password=? where id=?;";
		String info[] ={"888888","4"};
		FKJDBCUtil.executeUpdate(sql, info);
	}
	public static void test5(){//ɾ������
		String sql="delete from users where username=?";
		String info[]={"����"};
		FKJDBCUtil.executeUpdate(sql, info);
	}
}
