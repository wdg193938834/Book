package com.wdg.service;

import java.util.List;
import java.util.Map;

import com.wdg.entity.Book;

public interface BookService {
	public List<Book> getBookList(Map map);//查询图书列表
	public Long getTotal(Map map);//查询图书总量
	public int add(Book book);//增加图书
	public int update(Book book);//更新图书
	public int delete(Integer id);//删除图书
	public Book findById(Integer id);//根据bookId查找
	
	public List<Book> findByTypeId(Integer id);//根据typeId查找
}
