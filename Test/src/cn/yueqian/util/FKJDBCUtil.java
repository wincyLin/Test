package cn.yueqian.util;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FKJDBCUtil {
	//�������ݿ������Ϣ�ĳ���
	private static final String DRIVER="com.mysql.jdbc.Driver";//��������λ��
	private static final String URL="jdbc:mysql://127.0.0.1:3306/sp_db?useUnicode=true&characterEncoding=utf-8";
	private static final String USER="root";//�û������ݿ�
	private static final String PASSWORD="";//���ݿ����룬���û��������ã�""
	private static Connection ct=null;//������ӵĶ���
	private static PreparedStatement ps=null;//����sql���Ķ���
	private static ResultSet rs=null;//���صĽ��
	//1.��������
	static{
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//2.�������
	public static Connection getConnection(){
		try {
			ct = DriverManager.getConnection(URL,USER,PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ct;
		
	}
	//3.�õ�����sql������statement
	//��дһ����ѯ���ݿ�ķ��������ص���ResultSet
	//sql��sql��䣬info��ռλ���ľ�������
	public static ResultSet executeQuery(String sql,String[] info){
		//�õ�����
		ct = getConnection();
		try {
			//�õ�ps����
			ps = ct.prepareStatement(sql);
     //����ռλ��������
			if(info != null){
				//�п����кܶ��ռλ������Ҫ��forѭ��ȥ����
				for(int i = 0;i < info.length;i++){
					//��ռλ�����õ�sql�����
					ps.setString(1 + i, info[i]);
				}
			}
			//4.����sql��䣬���Ƿ��Ͳ�ѯsql�����
			rs = ps.executeQuery();
			//5.���ز��������ResultSet��
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//ע���ѯ��������Դ������������رգ���Ϊ����Ҫ�Բ�ѯ���Ľ�����в���
		return null;//ֻΪ�˲�����ִ�в������
	}
	//��дһ���������������ɾ�ĵĲ���
	public static int executeUpdate(String sql,String[] info){
		//�õ�����
		ct = getConnection();
		try {
			//�õ�ps����
			ps = ct.prepareStatement(sql);
     //����ռλ��������
			if(info != null){
				//�п����кܶ��ռλ������Ҫ��forѭ��ȥ����
				for(int i = 0;i < info.length;i++){
					//��ռλ�����õ�sql�����
					ps.setString(1 + i, info[i]);
				}
			}
			//4.����sql��䣬���Ƿ��Ͳ�ѯsql�����
			int row = ps.executeUpdate();
			//5.���ز��������ResultSet��
			if(row>0){
				System.out.println("�����ɹ���������"+row+"����¼��");
			}else{
				System.out.println("����ʧ�ܣ�");
			}
			return row;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{//�����Ƿ����쳣finally�еĴ��붼��ִ��
			//7.�ر���Դ
			close(ct,ps,rs);
		}
		
		return 0;//ֻΪ�˲�����ִ�в������
	}
	
	
	//7.�ر���Դ,�ȴ򿪣���ر�
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
	//��д�����������Է���ps��ct
	public static Connection getCt(){
		return ct;
	}
	public static PreparedStatement getPs(){
		return ps;
	}
	

}

