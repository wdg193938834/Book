package com.wdg.dao;

import java.util.List;

import com.wdg.entity.Type;

public interface TypeDAO {
	public int add(Type type);//�������
	
	public List<Type> getTypeList();//��ѯ�������
	
	public int update(Type type);//�޸����
	
	public Type findById(Integer id);//����ID������
}
