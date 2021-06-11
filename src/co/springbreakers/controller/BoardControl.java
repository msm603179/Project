package co.springbreakers.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.springbreakers.beans.Faq_Board;
import co.springbreakers.beans.Faq_Page;
import co.springbreakers.beans.Notice_Board;
import co.springbreakers.beans.Notice_Page;
import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.QA_Board;
import co.springbreakers.beans.QA_Board_Page;
import co.springbreakers.servies.BoardServies;
import co.springbreakers.servies.ImgServie;

@Controller
@RequestMapping("board")
public class BoardControl {
	
	@Autowired
	ImgServie iser;
	
	@Resource(name="uloginBean")
	Pc_user uloginBean;
	
	@Autowired
	BoardServies qaservies;
	
	
	@GetMapping("/qaboardlist")
	public String qaBoardList(@RequestParam(value = "pagenum" , defaultValue = "1")int pagenum, 
							@RequestParam(value = "pagesize", defaultValue = "10") int pagesize, Model m) {
		
		//총 개시글 개수
		int contentcount = qaservies.contentCount();
		
		if(contentcount == 0) {
			contentcount = 1;
		}
		
		QA_Board_Page qaboardpage = new QA_Board_Page(contentcount, pagenum, pagesize);
		
		
		List<QA_Board> allQABoard = qaservies.allContentList(qaboardpage.getStartrow(), qaboardpage.getEndrow());
		
		int qanumber = contentcount - (pagenum - 1) * pagesize;
		
		m.addAttribute("qanumber", qanumber);
		m.addAttribute("allQABoard", allQABoard);
		m.addAttribute("qaboardpage", qaboardpage);
		m.addAttribute("boardbackimg", iser.getpath("게시판배경"));
		m.addAttribute("noticebanner", iser.getpath("공지베너"));
		m.addAttribute("faqbanner", iser.getpath("질문베너"));
		m.addAttribute("qabanner", iser.getpath("문의베너"));
		m.addAttribute("side", iser.getpath("사이드버튼"));
		
		
		//공지사항
		int noticecontentcount = qaservies.noticeContentCount();
		
		if(noticecontentcount == 0) {
			noticecontentcount = 1;
		}
		
		Notice_Page noticepage = new Notice_Page(noticecontentcount, pagenum, pagesize);
		
		
		List<Notice_Board> allNoticeBoard = qaservies.allNoticeBoard(noticepage.getStartrow(), noticepage.getEndrow());
		
		int noticenumber = noticecontentcount - (pagenum - 1) * pagesize;
		
		m.addAttribute("noticenumber", noticenumber);
		m.addAttribute("allNoticeBoard", allNoticeBoard);
		m.addAttribute("noticepage", noticepage);
		
		
		//FAQ
		int faqcontentcount = qaservies.faqContentCount();
		
		if(faqcontentcount == 0) {
			faqcontentcount = 1;
		}
		
		Faq_Page faqpage = new Faq_Page(faqcontentcount, pagenum, pagesize);
		
		
		
		List<Faq_Board> allfaqBoard = qaservies.allFaqBoard(faqpage.getStartrow(), faqpage.getEndrow());
		
		
		int faqnumber = faqcontentcount - (pagenum - 1) * pagesize;
		
		m.addAttribute("faqnumber", faqnumber);
		m.addAttribute("allfaqBoard", allfaqBoard);
		m.addAttribute("faqpage", faqpage);
		
		m.addAttribute("id",uloginBean.getU_id());
	    m.addAttribute("idt", "u_id");
	    m.addAttribute("upd", "user/upuse");
	    m.addAttribute("enrol", "user/u_main");
	    m.addAttribute("qa", "board/qaboardlist");
	    m.addAttribute("rev", "board/revboardlist");
	    m.addAttribute("mail", "user/1on1write");
		
		
		return "board/boardlist";
	}
	
	
	@GetMapping("/qaboardwrite")
	public String qaBoardWrite(QA_Board qabean, Model m) {
		
		m.addAttribute("qabean", qabean);
		m.addAttribute("boardbackimg", iser.getpath("게시판배경"));
		
		System.out.println(iser.getpath("게시판배경"));
		
		return "board/qaboardwrite";
	}
	
	
	@PostMapping("/qawriter")
	public String addQAContent(QA_Board qabean) {
		
		
		
		int ref = qaservies.maxref();  //ref 최대값 불러옴.
		
		qabean.setRef(ref + 1);  //불러온 ref에 1 더함.
		qabean.setStep(0);
		qabean.setBolevel(0);
		qabean.setU_id(uloginBean.getU_id());  //세션영역 id 가져와서 세팅
		qabean.setReadcount(0);
		
		qaservies.addQAContent(qabean);
		
		
		
		return "board/qawritesucces";
	}
	
	
	@GetMapping("/qaboardread")
	public String qaread(@RequestParam("num") int num, Model m) {
		
		//조회수 증가
		qaservies.qareadCountUp(num);
		
		//클릭한 게시글 조회
		QA_Board qabean = qaservies.qaread(num);
		
		m.addAttribute("qabean" ,qabean);
		m.addAttribute("boardbackimg", iser.getpath("게시판배경"));
		m.addAttribute("qabanner", iser.getpath("문의베너"));
		m.addAttribute("side", iser.getpath("사이드버튼"));
		
		return "board/qaboardread";
	}
	
	
	
	
	//Q&A 댓글 입력
	@GetMapping("/qaboardcomment")
	public String qaboardcomment(@RequestParam("ref")int ref, @RequestParam("step")int step, @RequestParam("bolevel")int bolevel, QA_Board qabean, Model m) {
		
		qabean.setRef(ref);
		qabean.setStep(step + 1);
		qabean.setBolevel(bolevel + 1);
		qabean.setU_id(uloginBean.getU_id());
		qabean.setReadcount(0);
		
		m.addAttribute("qabean", qabean);
		
		return "board/qaboardcomment";
	}
	
	
	//Q&A 댓글입력
	@PostMapping("/qacommentsucces")
	public String qacommentsucces(QA_Board qabean) {
		qaservies.qaCommentAdd(qabean);
		
		return "board/qacommentsucces";
	}
	
	
	//공지사항 게시글 출력
	@GetMapping("/noticeboardread")
	public String noticeRead(@RequestParam("num") int num, Model m) {
		
		qaservies.noticeReadCountUp(num);
		
		Notice_Board notice = qaservies.noticeRead(num);
		
		m.addAttribute("notice", notice);
		m.addAttribute("noticebanner", iser.getpath("공지베너"));
		m.addAttribute("boardbackimg", iser.getpath("게시판배경"));
		m.addAttribute("side", iser.getpath("사이드버튼"));
		
		return "board/noticeboardread";
	}
	
	//자주하는질문 게시글 출력
		@GetMapping("/faqboardread")
		public String faqRead(@RequestParam("num") int num, Model m) {
			
			Faq_Board faq = qaservies.faqRead(num);
			
			m.addAttribute("faq", faq);
			m.addAttribute("faqbanner", iser.getpath("질문베너"));
			m.addAttribute("boardbackimg", iser.getpath("게시판배경"));
			m.addAttribute("side", iser.getpath("사이드버튼"));
			
			return "board/faqboardread";
		}

}
