package com.wdg.service;

import java.util.List;
import java.util.Map;

import com.wdg.entity.Book;
import com.wdg.entity.CartItem;

public interface OrderItemService {
	
	public int add(CartItem cartItem);//���Ӷ�����
	
	public List<CartItem> getList(Integer id);
}
