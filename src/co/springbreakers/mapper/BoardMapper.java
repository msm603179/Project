package co.springbreakers.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import co.springbreakers.beans.Faq_Board;
import co.springbreakers.beans.Notice_Board;
import co.springbreakers.beans.QA_Board;

public interface BoardMapper {

	// Q&A 총 게시판 글 수
	@Select("select count(*) from cu_board")
	int contentCount();

	// Q&A 게시판 전체 조회
	@Select("select * from (select A.*, Rownum Rnum from "
			+ "(select num, subject, content, u_id, to_char(writedate, 'yyyy-mm-dd') as writedate, "
			+ "ref, step, bolevel, readcount from cu_board order by ref desc, bolevel asc) A) where Rnum >= ${startrow} and Rnum <= ${endrow}")
	List<QA_Board> allQABoard(@Param("startrow") int startrow, @Param("endrow") int endrow);

	// Q&A 게시판 중 가장 큰 ref값 조회
	@Select("select max(ref) from cu_board")
	int maxref();

	// Q&A 게시판 글 등록
	@Insert("insert into cu_board(num, subject, content, u_id, writedate, ref, step, bolevel, readcount) "
			+ "values (food_seq.nextval, #{subject}, #{content}, #{u_id}, sysdate, #{ref}, #{step}, #{bolevel}, #{readcount})")
	void addQAContent(QA_Board qabean);

	// Q&A 게시글 클릭시 출력
	@Select("select num, subject, content, u_id, to_char(writedate, 'yyyy-mm-dd') as writedate, ref, step, bolevel, readcount "
			+ "from cu_board where num = #{num}")
	QA_Board qaread(int num);

	// Q&A 게시글 클릭시 조회수 증가
	@Update("update cu_board set readcount = readcount + 1 where num = ${num}")
	void qareadCountUp(int num);

	// Q&A 댓글쓸때 기존 글들 level 1씩 증가
	@Update("update cu_board set bolevel = bolevel + 1 where ref = ${ref} and bolevel > ${bolevel}")
	void qaLevelUp(@Param("ref") int ref, @Param("bolevel") int bolevel);

	///////////////////////////////////////////////////////////////////////////////////////////////////

	// 공지사항 총 게시판 글 수
	@Select("select count(*) from notice")
	int noticeContentCount();

	// 공지사항 게시판 중 가장 큰 ref값 조회
	@Select("select max(ref) from notice")
	int noticeMaxref();

	// 공지사항 게시판 전체조회
	@Select("select * from (select A.*, Rownum Rnum from "
			+ "(select notice_num, notice_subject, notice_content, to_char(writedate, 'yyyy-mm-dd') as writedate, "
			+ "ref, readcount from notice order by ref desc) A) where Rnum >= ${startrow} and Rnum <= ${endrow}")
	List<Notice_Board> allNoticeBoard(@Param("startrow") int startrow, @Param("endrow") int endrow);

	// 공지사항 게시글 클릭시 출력
	@Select("select notice_num, notice_subject, notice_content, to_char(writedate, 'yyyy-mm-dd') as writedate, ref, readcount "
			+ "from notice where notice_num = #{notice_num}")
	Notice_Board noticeRead(int num);

	// 공지사항 게시글 클릭시 조회수 증가
	@Update("update notice set readcount = readcount + 1 where notice_num = ${notice_num}")
	void noticeReadCountUp(int num);

	// 공지사항 게시판 글 등록
	@Insert("insert into notice(writedate, notice_num, notice_subject, notice_content, ref, readcount) "
			+ "values (sysdate, notice_seq.nextval, #{notice_subject}, #{notice_content}, #{ref}, #{readcount})")
	void addNoticeContent(Notice_Board notice);

	///////////////////////////////////////////////////////////////////////////////////////////////////

	// 자주하는질문 게시판 총 글 수
	@Select("select count(*) from faq")
	int faqContentCount();

	// 자주하는질문 게시판 중 가장 큰 ref값 조회
	@Select("select max(ref) from faq")
	int faqMaxref();

	// 자주하는질문 게시판 전체조회
	@Select("select * from (select A.*, Rownum Rnum from "
			+ "(select faq_num, faq_subject, faq_content, ref from faq order by ref desc) A) where Rnum >= ${startrow} and Rnum <= ${endrow}")
	List<Faq_Board> allFaqBoard(@Param("startrow") int startrow, @Param("endrow") int endrow);

	// 자주하는질문 게시글 클릭시 출력
	@Select("select * from faq where faq_num = #{faq_num}")
	Faq_Board faqRead(int faq_num);

	// 자주하는질문 게시판 글 등록
	@Insert("insert into faq(faq_num, faq_subject, faq_content, ref) values (faq_seq.nextval, #{faq_subject}, #{faq_content}, #{ref})")
	void addfaqContent(Faq_Board faq);

}
