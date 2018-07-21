package com.wdg.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wdg.entity.Book;
import com.wdg.entity.Type;
import com.wdg.service.BookService;
import com.wdg.service.TypeService;
@Controller
@RequestMapping("/type")
public class TypeController {
	@Autowired
	private TypeService typeService;
	@RequestMapping("/list")
	public String getBookList(HttpServletResponse response) throws Exception{
		List<Type> types=typeService.getTypeList();
		JSONObject result=new JSONObject();
		int total=20;
		JSONArray jsonArray=JSONArray.fromObject(types);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/add")
		public String add(Type type,HttpServletRequest request,HttpServletResponse response)throws Exception{	
		int result=0;
		if(type.getId()==null){
		 result=typeService.add(type);
		 }else{
		 result=typeService.update(type); 
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
	public String update(Type type,HttpServletResponse response)throws Exception{
	
		
	  int result=typeService.update(type);
	  if(result>0){
		  System.out.println("添加成功");
	    JSONObject result1=new JSONObject();
		result1.put("success", true);
		ResponseUtil.write(response, result1);
	  }
		return null;
	}*/
	@RequestMapping("/combolist")
	public String comboList(HttpServletResponse response)throws Exception{
		JSONArray jsonArray=new JSONArray();
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("id", "");
		jsonObject.put("name", "请选择...");
		jsonArray.add(jsonObject);
		List<Type> typeList=typeService.getTypeList();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.setExcludes(new String[]{"bigType","productList"});
		JSONArray rows=JSONArray.fromObject(typeList, jsonConfig);
		jsonArray.addAll(rows);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	}