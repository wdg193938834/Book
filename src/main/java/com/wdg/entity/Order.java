package com.wdg.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {
	private Integer id;
	private String orderNo;
	private Float money;
	private Date date;
	private String state;
	private String yonghu;
	private String address;
	private User user;
	private List<CartItem> cartItems=new ArrayList<CartItem>();
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	
	public List<CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Float getMoney() {
		return money;
	}
	public void setMoney(Float money) {
		this.money = money;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getYonghu() {
		return yonghu;
	}
	public void setYonghu(String yonghu) {
		this.yonghu = yonghu;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
