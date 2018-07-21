package com.wdg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wdg.dao.OrderDAO;
import com.wdg.dao.OrderItemDAO;
import com.wdg.entity.CartItem;
import com.wdg.entity.Order;
@Service
@Transactional
public class OrderServiceImpl implements OrderItemService{
	@Autowired
	private OrderItemDAO orderItemDAO;

	public int add(CartItem cartItem) {
		// TODO Auto-generated method stub
		return orderItemDAO.add(cartItem);
	}

	public List<CartItem> getList(Integer id) {
		// TODO Auto-generated method stub
		return orderItemDAO.getList(id);
	}

	

	
	
	

}
