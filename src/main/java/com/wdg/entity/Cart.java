package com.wdg.entity;

import java.util.ArrayList;
import java.util.List;


public class Cart {
	private List<CartItem> cartItems=new ArrayList<CartItem>();

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	
	
	
	
}
