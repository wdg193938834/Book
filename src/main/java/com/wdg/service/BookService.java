package com.wdg.service;

import java.util.List;
import java.util.Map;

import com.wdg.entity.Book;

public interface BookService {
	public List<Book> getBookList(Map map);//��ѯͼ���б�
	public Long getTotal(Map map);//��ѯͼ������
	public int add(Book book);//����ͼ��
	public int update(Book book);//����ͼ��
	public int delete(Integer id);//ɾ��ͼ��
	public Book findById(Integer id);//����bookId����
	
	public List<Book> findByTypeId(Integer id);//����typeId����
}
