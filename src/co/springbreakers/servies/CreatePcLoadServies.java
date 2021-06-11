package co.springbreakers.servies;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.springbreakers.beans.FoodImg;
import co.springbreakers.mapper.CreatePcMapper;
import co.springbreakers.repository.CreatePcLoadReposi;

@Service
public class CreatePcLoadServies {

	@Autowired
	CreatePcLoadReposi imgreposi;
	
	
	public void inpath(String pc_name,String pc_b_number,String pc_food_category,String pc_food_name,String pc_food_price,String pc_food_path) {
		   imgreposi.inpathrep(pc_name,pc_b_number,pc_food_category,pc_food_name,pc_food_price,pc_food_path);
		}
	
	public String getpath(String name) {
		String path=imgreposi.getpathrep(name);
		System.out.println(path);
		return path;
	}


}
