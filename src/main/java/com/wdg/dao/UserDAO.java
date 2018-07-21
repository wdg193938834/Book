package com.wdg.dao;

import java.util.List;
import java.util.Map;

import com.wdg.entity.User;


public interface UserDAO {
	  public List<User> queryAllUsers();
	  public User login(Map map); //用户登录
	  
	  public int insert(Map map);//用户注册
	}
