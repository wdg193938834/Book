package com.wdg.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wdg.entity.Book;
import com.wdg.service.BookService;
@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;
	
	
	
	@RequestMapping("/list")
	public String getBookList(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,Book book,HttpServletResponse response) throws Exception{
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),4);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("name",book.getName());
		
		Long total=bookService.getTotal(map);
		List<Book> books=bookService.getBookList(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(books);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/add")
		public String add(Book book,MultipartFile proPic,HttpServletRequest request,HttpServletResponse response)throws Exception{
		String fileName=null;
		if(proPic.getSize()!=0){
					fileName=proPic.getOriginalFilename();
					System.out.println("上传的文件原名称:"+fileName);
					String realPath=request.getSession().getServletContext().getRealPath("/");
					String path=realPath+"static/images/"+fileName;
					System.out.println("存放图片文件的路径:"+path);
					proPic.transferTo(new File(path));
					book.setImage(fileName);
				} 
		int result=0;
			if(book.getId()!=null){
				
				result=bookService.update(book);
		    
			}else{
				
				result=bookService.add(book);
			}
		  if(result>0){
			  System.out.println("添加成功");
		    JSONObject result1=new JSONObject();
			result1.put("success", "添加成功");
			ResponseUtil.write(response, result1);
		  }
			return null;
		}
	
	/*@RequestMapping("/update")
	public String update(Book book,MultipartFile proPic,HttpServletRequest request,HttpServletResponse response)throws Exception{
	String fileName=null;
	if(proPic!=null){
		fileName=proPic.getOriginalFilename();
		System.out.println("上传的文件原名称:"+fileName);
		String realPath=request.getSession().getServletContext().getRealPath("/");
		String path=realPath+"static/images/"+fileName;
		System.out.println("存放图片文件的路径:"+path);
		proPic.transferTo(new File(path));
		book.setImage(fileName);
	}
		
	   int result=bookService.update(book);
	  if(result>0){
		  System.out.println("添加成功");
	    JSONObject result1=new JSONObject();
		result1.put("success", true);
		ResponseUtil.write(response, result1);
	  }
		return null;
	}*/
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids",required=false)String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++){
			bookService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	}