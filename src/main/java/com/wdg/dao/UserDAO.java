package com.wdg.dao;

import java.util.List;
import java.util.Map;

import com.wdg.entity.User;


public interface UserDAO {
	  public List<User> queryAllUsers();
	  public User login(Map map); //�û���¼
	  
	  public int insert(Map map);//�û�ע��
	}
