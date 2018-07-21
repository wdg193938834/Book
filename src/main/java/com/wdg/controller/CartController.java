package com.wdg.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wdg.entity.Book;
import com.wdg.entity.Cart;
import com.wdg.entity.CartItem;
import com.wdg.entity.Order;
import com.wdg.entity.User;
import com.wdg.service.BookService;
import com.wdg.service.OrderItemService;
import com.wdg.service.OrderService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("")
public class CartController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderItemService orderItemService;
	int i=5432160;
	@RequestMapping("/add")//添加到购物车
	public String add(Integer bookId,HttpServletRequest request,HttpServletResponse response) throws Exception{
		Book book=bookService.findById(bookId);
		HttpSession session=request.getSession();
		Cart cart=(Cart) session.getAttribute("cart");
		if(cart==null){
			cart=new Cart();
		}
		List<CartItem> cartItems=cart.getCartItems();
		boolean flag=true;
		for(CartItem scI:cartItems){
			if(scI.getBook().getId()==book.getId()){
				scI.setCount(scI.getCount()+1);
				flag=false;
				break;
			}
		}
		
		CartItem cartItem=new CartItem();
		
		if(flag){
			cartItem.setBook(book);
			cartItem.setCount(1);
			cartItems.add(cartItem);
		}
		
		session.setAttribute("cart", cart);
		
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/delete")//从购物车移除
	public String delete(Integer bookId,HttpServletRequest request,HttpServletResponse response){
		Book book=bookService.findById(bookId);
		HttpSession session=request.getSession();
		Cart cart=(Cart) session.getAttribute("cart");
		List<CartItem> cartItems=cart.getCartItems();
		for(int i=0;i<cartItems.size();i++){
			if(bookId==cartItems.get(i).getBook().getId()){
				cartItems.remove(i);
				break;
			}
		}
		cart.setCartItems(cartItems);
		session.setAttribute("cart", cart);
		return "a_cart";
	}
	
	@RequestMapping("/update")//刷新购物车
	public String upadte(Integer bookId,Integer count,HttpServletRequest request,HttpServletResponse response) throws Exception{
		Book book=bookService.findById(bookId);
		HttpSession session=request.getSession();
		Cart cart=(Cart) session.getAttribute("cart");
		List<CartItem> cartItems=cart.getCartItems();
		for(CartItem scI:cartItems){
			if(scI.getBook().getId()==book.getId()){
				scI.setCount(count);
				
				break;
			}
		}
		session.setAttribute("cart", cart);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return "a_cart";
	}
	
	@RequestMapping("/submit")//生成订单
	public String submit(Float total,HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		Cart cart=(Cart) session.getAttribute("cart");
		List<CartItem> cartItems=cart.getCartItems();
		User user=(User) session.getAttribute("currentUser");
		
		Order order=new Order();
		i=++i;
		order.setOrderNo(String.valueOf(i));
		order.setUser(user);
		order.setMoney(total);
		order.setState("yes");
		order.setYonghu(user.getName());
		order.setAddress("单位房为");
		order.setCartItems(cartItems);
		order.setDate(new Date());
		orderService.add(order);
		
		
		for(CartItem c:cartItems){
			c.setOrder(order);
			orderItemService.add(c);
		}
		
		session.removeAttribute("cart");
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/orderList")//获取订单
	public String orderList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("user", user);
		List<Order> orders=orderService.getOrderList(map);
		
		for(Order o:orders){
			List<CartItem> orderItems=orderItemService.getList(o.getId());
			o.setCartItems(orderItems);
		}
		session.setAttribute("orders", orders);
		
		return "a_orderList";
	}
	
}
