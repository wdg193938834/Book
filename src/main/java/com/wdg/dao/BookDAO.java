package com.wdg.dao;

import java.util.List;
import java.util.Map;

import com.wdg.entity.Book;

public interface BookDAO {
	public List<Book> getBookList(Map map);//��ѯͼ���б�
	public Long getTotal(Map map);
	public int add(Book book);//������Ʒ
	public int update(Book book);//������Ʒ
	public int delete(Integer id);//ɾ����Ʒ
	
	public Book findById(Integer id);//����bookId����
	
	public List<Book> findByTypeId(Integer id);//����typeId����
}
