package cn.yueqian.dao;

public interface UserDao {
	//1.����һ������username�ķ���
	void save(String username,String password);
	//2.����һ����������boolean�ж��û��Ƿ��Ѿ���ע��
	boolean findByUsername(String username);
	//3.����һ������������һ��boolean���ж��û��Ƿ��½
	boolean LoginUsername(String username,String password);

	
	
	
}
