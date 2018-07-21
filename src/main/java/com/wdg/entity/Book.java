package com.wdg.entity;

public class Book {
	private Integer id;
	private String name;
	private String author;
	private String image;
	private String chubanshe;
	private Integer dangprice;
	private Integer kucun;
	private Integer xiaoliang;
	private Type  booktype;

	
	
	public Type getBooktype() {
		return booktype;
	}
	public void setBooktype(Type booktype) {
		this.booktype = booktype;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getChubanshe() {
		return chubanshe;
	}
	public void setChubanshe(String chubanshe) {
		this.chubanshe = chubanshe;
	}
	public Integer getDangprice() {
		return dangprice;
	}
	public void setDangprice(Integer dangprice) {
		this.dangprice = dangprice;
	}
	public Integer getKucun() {
		return kucun;
	}
	public void setKucun(Integer kucun) {
		this.kucun = kucun;
	}
	public Integer getXiaoliang() {
		return xiaoliang;
	}
	public void setXiaoliang(Integer xiaoliang) {
		this.xiaoliang = xiaoliang;
	}
	
	
	
}
