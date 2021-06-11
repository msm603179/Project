package co.springbreakers.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.springbreakers.beans.FoodImg;
import co.springbreakers.mapper.ImgMapper;

@Repository
public class imgreposi {
	
	@Autowired
	ImgMapper map;
	
	public void inpathrep(String name,String path) {
	   map.inpath(name, path);
	}
	
	public String getpathrep(String name) {
		String path=map.getpath(name);
		return path;
	}
}
