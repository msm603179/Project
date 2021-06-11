package co.springbreakers.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import co.springbreakers.beans.Pc_Board;
import co.springbreakers.beans.review_board;
import co.springbreakers.beans.review_board_page;

public interface RevBoardMapper {
	
	//게시글 작성
	@Insert("insert into pc_board (rdate,num,content,id,ref) values(sysdate,review_seq.nextval,#{content},#{id},#{ref})")
	void revwrite(review_board re);
	
	///ref +1;
	@Select("select max(ref) from pc_board")
	int maxref();
	
	//ref순 정렬후 게시글 불러오기
	@Select("select * from pc_board order by ref desc")
	List<review_board> allboard();
	
	//전체글 수
	@Select("select count(*) from pc_board")
	int bocount();
	                           //rownum = 행 번호를 rn으로 지정
	@Select("select * from(select rownum rn, A.* from(select * from pc_board order by ref desc)A)where rn between #{start} and #{end}")
	List<review_board> allborddb(review_board_page rbp);
}
