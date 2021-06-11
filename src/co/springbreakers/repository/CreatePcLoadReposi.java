package co.springbreakers.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.springbreakers.beans.FoodImg;
import co.springbreakers.mapper.CreatePcMapper;

@Repository
public class CreatePcLoadReposi {

	@Autowired
	CreatePcMapper imgmap;
	
	
	public void inpathrep(String pc_name,String pc_b_number,String pc_food_category,String pc_food_name,String pc_food_price,String pc_food_path) {
		   imgmap.inpath(pc_name,pc_b_number,pc_food_category,pc_food_name,pc_food_price,pc_food_path);
		}
		
		public String getpathrep(String name) {
			String path=imgmap.getpath(name);
			return path;
		}


}
