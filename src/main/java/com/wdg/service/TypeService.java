package com.wdg.service;

import java.util.List;

import com.wdg.entity.Type;

public interface TypeService {
	public int add(Type type);//添加类别
	
	public List<Type> getTypeList();//查询所有类别
	
	public int update(Type type);//修改类别
}
