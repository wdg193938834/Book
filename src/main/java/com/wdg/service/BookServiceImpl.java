package com.wdg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wdg.dao.BookDAO;
import com.wdg.dao.UserDAO;
import com.wdg.entity.Book;
@Service
@Transactional
public class BookServiceImpl implements BookService{
	@Autowired
	private BookDAO bookDAO;

	public int add(Book book) {
		// TODO Auto-generated method stub
		return bookDAO.add(book);
	}
	public int update(Book book) {
		// TODO Auto-generated method stub
		return bookDAO.update(book);
	}
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return bookDAO.delete(id);
	}
	public List<Book> getBookList(Map map) {
		// TODO Auto-generated method stub
		return bookDAO.getBookList(map);
	}
	public Long getTotal(Map map) {
		// TODO Auto-generated method stub
		return bookDAO.getTotal(map);
	}
	public Book findById(Integer id) {
		// TODO Auto-generated method stub
		return bookDAO.findById(id);
	}
	public List<Book> findByTypeId(Integer id) {
		// TODO Auto-generated method stub
		return bookDAO.findByTypeId(id);
	}

}
