package cn.yueqian.dao;

public interface SP_carDao {
	//1.��ӹ��ﳵ����
	int addSP_car(String sp_id,String username,String number );
	//2.��ѯ�û����Ƿ����
	boolean findSP_car(String sp_car_id,String sp_car_user);
	//3.�޸Ĺ��ﳵ��Ϣ
	int updateSP_car(String sp_car_id,String number,String sp_car_user);
	//ɾ�����ﳵ��Ϣ
	int deleteSP_car(String sp_car_id,String number,String sp_car_user);
		
	
}
