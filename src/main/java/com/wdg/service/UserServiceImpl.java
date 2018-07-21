package com.wdg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wdg.dao.UserDAO;
import com.wdg.entity.User;


@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public List<User> findAllUsers() {
       return userDAO.queryAllUsers();
	}

	public User login(Map map) {
		
		return userDAO.login(map);
	}

	public int insert(Map map) {
		return userDAO.insert(map);
	}

}