package com.wdg.dao;

import java.util.List;
import java.util.Map;

import com.wdg.entity.Book;
import com.wdg.entity.CartItem;

public interface OrderItemDAO {
	
	public int add(CartItem cartItem);//增加订单项
	
	public List<CartItem> getList(Integer id);
	
}
