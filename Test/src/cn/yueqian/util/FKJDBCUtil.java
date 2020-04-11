package cn.yueqian.util;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FKJDBCUtil {
	//定义数据库基本信息的常量
	private static final String DRIVER="com.mysql.jdbc.Driver";//驱动包的位置
	private static final String URL="jdbc:mysql://127.0.0.1:3306/sp_db?useUnicode=true&characterEncoding=utf-8";
	private static final String USER="root";//用户名数据库
	private static final String PASSWORD="";//数据库密码，如果没有密码就用：""
	private static Connection ct=null;//获得连接的对象
	private static PreparedStatement ps=null;//发送sql语句的对象
	private static ResultSet rs=null;//返回的结果
	//1.加载驱动
	static{
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//2.获得连接
	public static Connection getConnection(){
		try {
			ct = DriverManager.getConnection(URL,USER,PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ct;
		
	}
	//3.得到发送sql语句对象statement
	//编写一个查询数据库的方法，返回的是ResultSet
	//sql：sql语句，info：占位符的具体内容
	public static ResultSet executeQuery(String sql,String[] info){
		//得到连接
		ct = getConnection();
		try {
			//得到ps对象
			ps = ct.prepareStatement(sql);
     //处理占位符的问题
			if(info != null){
				//有可能有很多个占位符所以要用for循环去处理
				for(int i = 0;i < info.length;i++){
					//将占位符设置到sql语句中
					ps.setString(1 + i, info[i]);
				}
			}
			//4.发送sql语句，这是发送查询sql的语句
			rs = ps.executeQuery();
			//5.返回操作结果（ResultSet）
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//注意查询方法的资源不可以在这里关闭，因为我吗还要对查询到的结果进行操作
		return null;//只为了不报错，执行不到这句
	}
	//编写一个方法可以完成增删改的操作
	public static int executeUpdate(String sql,String[] info){
		//得到连接
		ct = getConnection();
		try {
			//得到ps对象
			ps = ct.prepareStatement(sql);
     //处理占位符的问题
			if(info != null){
				//有可能有很多个占位符所以要用for循环去处理
				for(int i = 0;i < info.length;i++){
					//将占位符设置到sql语句中
					ps.setString(1 + i, info[i]);
				}
			}
			//4.发送sql语句，这是发送查询sql的语句
			int row = ps.executeUpdate();
			//5.返回操作结果（ResultSet）
			if(row>0){
				System.out.println("操作成功，作用了"+row+"条记录！");
			}else{
				System.out.println("操作失败！");
			}
			return row;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{//无论是否有异常finally中的代码都会执行
			//7.关闭资源
			close(ct,ps,rs);
		}
		
		return 0;//只为了不报错，执行不到这句
	}
	
	
	//7.关闭资源,先打开，后关闭
	public static void close(Connection ct,PreparedStatement ps,ResultSet rs){
		try{
			if(rs != null){
				rs.close();
			}
			rs = null;
		}catch(SQLException e){
			e.printStackTrace();
		}
		try{  
			if(ps != null){
				ps.close();
			}
			ps = null;
		}catch(SQLException e){
			e.printStackTrace();
		}
		try{
			if(ct != null){
				ct.close();
			}
			ct = null;
		}catch(SQLException e){
			e.printStackTrace();
		}		
		
	}
	//编写两个方法可以返回ps，ct
	public static Connection getCt(){
		return ct;
	}
	public static PreparedStatement getPs(){
		return ps;
	}
	

}

