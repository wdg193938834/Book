package com.wdg.dao;

import java.util.List;
import java.util.Map;

import com.wdg.entity.Order;


public interface OrderDAO {
	public List<Order> getOrderList(Map map);//查询订单列表
	
	public Long getTotal(Map map);//查询总数
	
	public Integer add(Order order);//生成订单
	
	
}
