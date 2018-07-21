package com.wdg.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdg.entity.Book;
import com.wdg.entity.Type;
import com.wdg.service.BookService;
import com.wdg.service.TypeService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("")
public class IndexController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private TypeService typeService;
	
	@RequestMapping("/index")
	public String getBookLis(Book book,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name",book.getName());
		
		Long total=bookService.getTotal(map);
		List<Book> books=bookService.getBookList(map);
		List<Type> types=typeService.getTypeList();
		
		request.getSession().setAttribute("booklist", books);
		request.getSession().setAttribute("typelist", types);
		
		
		response.sendRedirect("index.jsp");
		return null;
	}

	@RequestMapping("/findById")
	public String findById(Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Book book=bookService.findById(id);
		request.getSession().setAttribute("book", book);
		response.sendRedirect("a_productDetails.jsp");
		return null;
	}

	@RequestMapping("/findByTypeId")
	public String findByTypeId(Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Book> books=bookService.findByTypeId(id);
		request.getSession().setAttribute("bookByType", books);
		response.sendRedirect("a_productType.jsp");
		
		return null;
	}
	@RequestMapping("/findByname")
	public String getBookList(Book book,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name",book.getName());
		
		List<Book> books=bookService.getBookList(map);
		request.getSession().setAttribute("bookByname", books);
		
		response.sendRedirect("a_searchresult.jsp");
		return null;
	}
}
