package com.wdg.service;

import java.util.List;

import com.wdg.entity.Type;

public interface TypeService {
	public int add(Type type);//������
	
	public List<Type> getTypeList();//��ѯ�������
	
	public int update(Type type);//�޸����
}
