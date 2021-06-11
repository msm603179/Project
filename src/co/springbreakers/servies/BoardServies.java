package co.springbreakers.servies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.springbreakers.beans.Faq_Board;
import co.springbreakers.beans.Notice_Board;
import co.springbreakers.beans.QA_Board;
import co.springbreakers.repository.BoardReposi;

@Service
public class BoardServies {

	@Autowired
	BoardReposi qareposi;

	// Q&A 총 게시판 글 수
	public int contentCount() {
		return qareposi.contentCount();
	}

	// Q&A 게시판 모든 게시글 조회
	public List<QA_Board> allContentList(int startrow, int endrow) {

		List<QA_Board> allQABoard = qareposi.allContentList(startrow, endrow);

		return allQABoard;
	}

	// Q&A 게시판 최대 ref값 조회
	public int maxref() {
		return qareposi.maxref();
	}

	// Q&A 게시판 글쓰기
	public void addQAContent(QA_Board qabean) {
		qareposi.addQAContent(qabean);
	}

	// Q&A 게시판 클릭시 조회수 증가
	public void qareadCountUp(int num) {
		qareposi.qareadCountUp(num);
	}

	// Q&A 게시글 클릭시 글 출력
	public QA_Board qaread(int num) {
		return qareposi.qaread(num);
	}

	// Q&A 댓글 쓰기
	public QA_Board qaCommentAdd(QA_Board qabean) {

		qareposi.qaLevelUp(qabean.getRef(), qabean.getBolevel());

		System.out.println(qabean.getRef());
		System.out.println(qabean.getBolevel());

		String commentsubject;

		if (qabean.getSubject().contains("  ")) {
			commentsubject = "&nbsp;&nbsp;&nbsp;&nbsp;ㄴ" + qabean.getSubject();
		} else {
			commentsubject = "&nbsp;&nbsp;ㄴ" + qabean.getSubject();
		}

		qabean.setSubject(commentsubject);

		qareposi.addQAContent(qabean);

		return qabean;
	}

	//////////////////////////////////////////////////////////////////////////////////////////

	// 공지사항 총 게시판 글 수
	public int noticeContentCount() {
		return qareposi.noticeContentCount();
	}

	// 공지사항 게시판 모든 게시글 조회
	public List<Notice_Board> allNoticeBoard(int startrow, int endrow) {

		List<Notice_Board> allNoticeBoard = qareposi.allNoticeBoard(startrow, endrow);

		return allNoticeBoard;
	}

	// 공지사항 게시판 최대 ref값 조회
	public int noticeMaxref() {
		return qareposi.noticeMaxref();
	}

	// 공지사항 게시판 글쓰기
	public void addNoticeContent(Notice_Board notice) {
		qareposi.addNoticeContent(notice);
	}

	// 공지사항 게시판 클릭시 조회수 증가
	public void noticeReadCountUp(int num) {
		qareposi.noticeReadCountUp(num);
	}

	// 공지사항 게시글 클릭시 글 출력
	public Notice_Board noticeRead(int num) {
		return qareposi.noticeRead(num);
	}

	//////////////////////////////////////////////////////////////////////////////////////////

	// 자주하는질문 총 게시판 글 수
	public int faqContentCount() {
		return qareposi.faqContentCount();
	}

	// 자주하는질문 게시판 모든 게시글 조회
	public List<Faq_Board> allFaqBoard(int startrow, int endrow) {

		List<Faq_Board> allNoticeBoard = qareposi.allFaqBoard(startrow, endrow);

		return allNoticeBoard;
	}

	// 자주하는질문 게시판 최대 ref값 조회
	public int faqMaxref() {
		return qareposi.faqMaxref();
	}

	// 자주하는질문 게시판 글쓰기
	public void addfaqContent(Faq_Board faq) {
		qareposi.addfaqContent(faq);
	}


	// 자주하는질문 게시글 클릭시 글 출력
	public Faq_Board faqRead(int num) {
		return qareposi.faqRead(num);
	}
}
