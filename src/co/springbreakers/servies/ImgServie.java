package co.springbreakers.servies;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.springbreakers.repository.imgreposi;

@Service
public class ImgServie {
	
	@Autowired
	imgreposi rep;
	
	public void inpath(String name,String path) {
		   rep.inpathrep(name, path);
		}
	
	public String getpath(String name) {
		String path=rep.getpathrep(name);
		
		return path;
	}
}
