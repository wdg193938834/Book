package com.wdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wdg.dao.TypeDAO;
import com.wdg.entity.Type;
@Service
@Transactional
public class TypeServiceImpl implements TypeService {
	@Autowired
	private TypeDAO typeDAO;
	public int add(Type type) {
		// TODO Auto-generated method stub
		return typeDAO.add(type);
	}
	public List<Type> getTypeList() {
		// TODO Auto-generated method stub
		return typeDAO.getTypeList();
	}
	public int update(Type type) {
		// TODO Auto-generated method stub
		return typeDAO.update(type);
	}

}
