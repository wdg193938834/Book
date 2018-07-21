package com.wdg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wdg.dao.OrderDAO;
import com.wdg.entity.Order;
@Service
@Transactional
public class OrderItemServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;

	

	public List<Order> getOrderList(Map map) {
		// TODO Auto-generated method stub
		return orderDAO.getOrderList(map);
	}

	public Long getTotal(Map map) {
		// TODO Auto-generated method stub
		return orderDAO.getTotal(map);
	}

	public Integer add(Order order) {
		// TODO Auto-generated method stub
		return orderDAO.add(order);
	}
	
	

}
