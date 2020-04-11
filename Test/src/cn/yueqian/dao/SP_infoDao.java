package cn.yueqian.dao;

import java.util.ArrayList;
import java.util.List;

import cn.yueqian.javabean.SP_info;

public interface SP_infoDao {
	//1.查询首页要显示的商品信息
	List<SP_info> getSP_infoList(String type,String sous_info,String id);
	
	
}
