package cn.yueqian.dao;

import java.util.ArrayList;
import java.util.List;

import cn.yueqian.javabean.SP_info;

public interface SP_infoDao {
	//1.��ѯ��ҳҪ��ʾ����Ʒ��Ϣ
	List<SP_info> getSP_infoList(String type,String sous_info,String id);
	
	
}
