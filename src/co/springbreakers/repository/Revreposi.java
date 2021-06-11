package co.springbreakers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.springbreakers.beans.review_board;
import co.springbreakers.beans.review_board_page;
import co.springbreakers.mapper.RevBoardMapper;

@Repository
public class Revreposi {
	
	@Autowired
	RevBoardMapper map;
	
	public void inrevrep(review_board re) {
		map.revwrite(re);
	}
	
	public int maxrefrep() {
		return map.maxref();
	}
	
	public List<review_board> allboardrep(){
		return map.allboard();
	}
	
	public int bocountrep() {
		return map.bocount();
	}
	
	public List<review_board> allboarddbrep(review_board_page rbp){
	return map.allborddb(rbp);
	}



}
