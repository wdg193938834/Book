package com.wdg.dao;

import java.util.List;
import java.util.Map;

import com.wdg.entity.Order;


public interface OrderDAO {
	public List<Order> getOrderList(Map map);//��ѯ�����б�
	
	public Long getTotal(Map map);//��ѯ����
	
	public Integer add(Order order);//���ɶ���
	
	
}
