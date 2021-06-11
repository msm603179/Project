package co.springbreakers.servies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.springbreakers.beans.review_board;
import co.springbreakers.beans.review_board_page;
import co.springbreakers.repository.Revreposi;

@Service
public class RevServie {

	@Autowired
	Revreposi rep;
	
	public void inrev(review_board re) {
		rep.inrevrep(re);
	}
	
	public int maxref() {

		int ref;

		// 데이터 없을시 ref 0으로 세팅
		try {
			ref = rep.maxrefrep();
		} catch (Exception e) {
			ref = -1;
		}

		return ref;
	}
	
	public List<review_board> allboard(){
		
		
		return rep.allboardrep();
	}
	
	
	public int bocount() {
		return rep.bocountrep();
	}
	
	public List<review_board> allboarddb(review_board_page rbp){
	return rep.allboarddbrep(rbp);
	}
	
	
}
