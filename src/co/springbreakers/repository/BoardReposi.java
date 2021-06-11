package co.springbreakers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.springbreakers.beans.Faq_Board;
import co.springbreakers.beans.Notice_Board;
import co.springbreakers.beans.QA_Board;
import co.springbreakers.mapper.BoardMapper;

@Repository
public class BoardReposi {

	@Autowired
	BoardMapper qaboardmap;

	// Q&A 총 게시판 글 수
	public int contentCount() {
		return qaboardmap.contentCount();
	}

	// 모든 게시판 글 조회
	public List<QA_Board> allContentList(int startrow, int endrow) {

		List<QA_Board> allQABoard = qaboardmap.allQABoard(startrow, endrow);

		return allQABoard;
	}

	// Q&A 게시판 최대 ref 값 조회
	public int maxref() {

		int ref;

		// 데이터 없을시 ref 0으로 세팅
		try {
			ref = qaboardmap.maxref();
		} catch (Exception e) {
			ref = -1;
		}

		return ref;
	}

	// Q&A 게시판 글쓰기
	public void addQAContent(QA_Board qabean) {
		qaboardmap.addQAContent(qabean);
	}

	// Q&A 게시글 조회수 증가
	public void qareadCountUp(int num) {
		qaboardmap.qareadCountUp(num);
	}

	// Q&A 게시판 글 읽기
	public QA_Board qaread(int num) {
		return qaboardmap.qaread(num);
	}

	// level 값 1씩 증가
	public void qaLevelUp(int ref, int bolevel) {
		qaboardmap.qaLevelUp(ref, bolevel);
	}

	/////////////////////////////////////////////////////////////////////////////

	// 공지사항 총 게시글 수
	public int noticeContentCount() {
		return qaboardmap.noticeContentCount();
	}

	// 공지사항 리스트 조회
	public List<Notice_Board> allNoticeBoard(int startrow, int endrow) {

		List<Notice_Board> list = qaboardmap.allNoticeBoard(startrow, endrow);

		return list;
	}

	// 공지사항 게시판 최대 ref 값 조회
	public int noticeMaxref() {

		int ref;

		// 데이터 없을시 ref 0으로 세팅
		try {
			ref = qaboardmap.noticeMaxref();
		} catch (Exception e) {
			ref = -1;
		}

		return ref;
	}

	// 공지사항 게시판 글쓰기
	public void addNoticeContent(Notice_Board notice) {
		qaboardmap.addNoticeContent(notice);
	}

	// 공지사항 게시글 조회수 증가
	public void noticeReadCountUp(int num) {
		qaboardmap.noticeReadCountUp(num);
	}

	// 공지사항 게시판 글 읽기
	public Notice_Board noticeRead(int num) {
		return qaboardmap.noticeRead(num);
	}

	////////////////////////////////////////////////////////////////////////////////////
	
	
	// 자주하는질문 총 게시글 수
	public int faqContentCount() {
		return qaboardmap.faqContentCount();
	}

	// 자주하는질문 리스트 조회
	public List<Faq_Board> allFaqBoard(int startrow, int endrow) {

		List<Faq_Board> list = qaboardmap.allFaqBoard(startrow, endrow);

		return list;
	}

	// 자주하는질문 게시판 최대 ref 값 조회
	public int faqMaxref() {

		int ref;

		// 데이터 없을시 ref 0으로 세팅
		try {
			ref = qaboardmap.faqMaxref();
		} catch (Exception e) {
			ref = -1;
		}

		return ref;
	}

	// 자주하는질문 게시판 글쓰기
	public void addfaqContent(Faq_Board faq) {
		qaboardmap.addfaqContent(faq);
	}

	// 자주하는질문 게시판 글 읽기
	public Faq_Board faqRead(int num) {
		return qaboardmap.faqRead(num);
	}

}
