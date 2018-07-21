package com.wdg.dao;

import java.util.List;
import java.util.Map;

import com.wdg.entity.Book;

public interface BookDAO {
	public List<Book> getBookList(Map map);//查询图书列表
	public Long getTotal(Map map);
	public int add(Book book);//增加商品
	public int update(Book book);//更新商品
	public int delete(Integer id);//删除商品
	
	public Book findById(Integer id);//根据bookId查找
	
	public List<Book> findByTypeId(Integer id);//根据typeId查找
}
