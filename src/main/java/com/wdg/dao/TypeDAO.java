package com.wdg.dao;

import java.util.List;

import com.wdg.entity.Type;

public interface TypeDAO {
	public int add(Type type);//增加类别
	
	public List<Type> getTypeList();//查询所有类别
	
	public int update(Type type);//修改类别
	
	public Type findById(Integer id);//根据ID查类型
}
