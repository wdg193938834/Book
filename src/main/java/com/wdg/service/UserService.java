package com.wdg.service;

import java.util.List;
import java.util.Map;

import com.wdg.entity.User;


public interface UserService {
	   public User login(Map map);
	   public List<User> findAllUsers();
	   
	   public int insert(Map map);//ÓÃ»§×¢²á
	}

