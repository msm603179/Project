package co.springbreakers.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.Zip;
import co.springbreakers.mapper.CreatePcMapper;
import co.springbreakers.mapper.ImgMapper;
import co.springbreakers.mapper.Usermapper;
import co.springbreakers.servies.ImgServie;
import co.springbreakers.servies.Userservie;
import co.springbreakers.validation.validate;

@Controller
@RequestMapping("user")
//유저 관련 컨트롤러
public class UserControl {

	@Autowired
	Usermapper map;

	@Autowired
	Userservie userv;

	@Autowired
	ImgServie iser;

	@Autowired
	CreatePcMapper cmap;

	@Resource(name = "uloginBean")
	private Pc_user uloginBean; // 세션 pc_user

	// 회원가입
	@GetMapping(value = "/inuser")
	public String inuser(Pc_user user, Model model) {

		model.addAttribute("inuserbackimg", iser.getpath("유저가입배경"));

		return "user/inuser";
	}

	@InitBinder("pc_user") // beans이름으로
	public void InitBinder(WebDataBinder binder) {
		validate v1 = new validate();

		binder.addValidators(v1);
	}

	// 회원가입 동작
	@RequestMapping(value = "/inuse")
	public String inuse(@Valid Pc_user user, BindingResult re, Model model) {
		model.addAttribute("inuserbackimg", iser.getpath("유저가입배경"));
		if (re.hasErrors()) {
			return "user/inuser";
		}
		userv.userin(user);
		return "user/u_inuser_suc"; // 가입 성공 여부
	}

	@RequestMapping(value = "/upuse") // 회원 정보 수정 유효성검사 안됨 나중에 바꿔야댐
	public String upuse(String u_id, HttpServletRequest req, Model model) {

		model.addAttribute("inuserbackimg", iser.getpath("유저가입배경"));

		Pc_user user = userv.userupli(u_id);

		req.setAttribute("user", user);

		return "forward:/user/upuser";
	}

	@RequestMapping(value = "/upuser") // 회원 정보 수정 동작
	public String upuser(Pc_user user, HttpServletRequest req, Model model) {

		user = (Pc_user) req.getAttribute("user");

		model.addAttribute("img", iser.getpath("유저가입배경"));

		return "user/upuser";
	}

	@RequestMapping(value = "/upusego") // 유효성검사안댐
	public String upusego(@Valid @ModelAttribute("user") Pc_user user, BindingResult re) {
		if (re.hasErrors()) {
			return "user/upuser";
		}
		userv.userup(user);

		return "user/u_upuser_suc";
	}

	@RequestMapping(value = "/addr") // 주소 관련페이지
	public String zipsearch(Zip zip, Model mo) {

		List<Zip> zip2 = userv.zipsearch(zip);

		mo.addAttribute("zip2", zip2);
		List<String> addrli = new ArrayList<>();
		for (int i = 0; i < zip2.size(); i++) {
			Zip str = zip2.get(i);

			String exaddr = str.getArea1() + str.getArea2() + str.getArea3();
			String addr = exaddr.replaceAll(" ", "");

			addrli.add(addr);
		}
		mo.addAttribute("addrli", addrli);

		return "user/addr";
	}

	// 유저 로그인
	@RequestMapping(value = "u_login")
	public String login(Pc_user user, Model mo) {
		mo.addAttribute("logimg", iser.getpath("일반"));
		return "user/u_login";
	}

	// 로그인 동작
	@RequestMapping(value = "u_log")
	public String ulog(Pc_user user) {

		user.setUidchk(userv.uidchk(user.getU_id()));

		if (user.isUidchk() == false) {
			return "user/u_log_fail";
		} else {
			String dbpw = userv.selu_pw(user);

			if (dbpw.equals(user.getU_pw())) {
				user = userv.userupli(user.getU_id());

				uloginBean.setPc_userLogin(true);
				uloginBean.setU_join_date(user.getU_join_date());
				uloginBean.setU_name(user.getU_name());
				uloginBean.setU_id(user.getU_id());
				uloginBean.setU_pw(user.getU_pw());
				uloginBean.setU_birthday(user.getU_birthday());
				uloginBean.setU_phone(user.getU_phone());
				uloginBean.setU_addr(user.getU_addr());
				uloginBean.setU_email(user.getU_email());

				return "user/u_log_suc";
			} else {
				return "user/u_log_fail";
			}
		}

	}

	// 로그인 체크페이지
	@RequestMapping(value = "u_not_login")
	public String notlogin() {

		return "user/u_not_login";
	}

	// 아이디 찾기
	@RequestMapping(value = "u_id_find")
	public String idfind(Pc_user user) {

		return "user/u_id_find";
	}

	// 아이디 찾기
	@RequestMapping(value = "u_id_findrun")
	public String idfindrun(Pc_user user, HttpServletRequest req) {
		String id = userv.findu_id(user);
		if (id != null) {
			req.setAttribute("id", id);
			return "user/u_id_findrun";

		} else {
			return "user/u_id_find";
		}

	}

	// 비밀번호 찾기
	@RequestMapping(value = "u_pw_find")
	public String pwfind(Pc_user user) {

		return "user/u_pw_find";
	}

	// 아이디 찾기
	@RequestMapping(value = "u_pw_findrun")
	public String pwfindrun(Pc_user user, HttpServletRequest req) {
		String pw = userv.findu_pw(user);
		if (pw != null) {
			req.setAttribute("pw", pw);
			return "user/u_pw_findrun";

		} else {
			return "user/u_pw_find";
		}

	}

	@RequestMapping(value = "u_main")
	public String umain(Model mo) {

		String sql = "select pc_address from enrol_pc";
		String sql2 = "select pc_name from enrol_pc";
		String sql3 = "select pc_b_number from enrol_pc";
		List<String> pcaddr = cmap.pcinfo(sql);
		List<String> pcname = cmap.pcinfo(sql2);
		List<String> pcbnumber = cmap.pcinfo(sql3);
		for (int i = 0; i < pcaddr.size(); i++) {
			String addr = pcaddr.get(i);
			String name = pcname.get(i);
			String number = pcbnumber.get(i);

			String addrfix;

			try {
				int idx = addr.indexOf("~");
				addrfix = addr.substring(0, idx);
			} catch (Exception e) {
				addrfix = addr;
			}

			mo.addAttribute("addr" + i, addrfix);
			mo.addAttribute("name" + i, name);
			mo.addAttribute("num" + i, number);
		}

		mo.addAttribute("id", uloginBean.getU_id());
		mo.addAttribute("idt", "u_id");
		mo.addAttribute("upd", "user/upuse");
		mo.addAttribute("enrol", "user/u_main");
		mo.addAttribute("qa", "board/qaboardlist");
		mo.addAttribute("rev", "board/revboardlist");
		mo.addAttribute("mail", "user/1on1write");
		mo.addAttribute("side", iser.getpath("사이드버튼"));
		mo.addAttribute("mainbackimg", iser.getpath("유저메인배경"));
		mo.addAttribute("logo", iser.getpath("로고"));

		return "user/u_main";
	}

	@RequestMapping(value = "1on1write")
	public String onwr() {
		return "user/1on1write";
	}

	@RequestMapping(value = "1on1send")
	public String onse(HttpServletRequest req, Model mo) throws AddressException, MessagingException {

		String host = "smtp.naver.com";// 네이버 설정
		final String username = uloginBean.getU_id(); // 네이버 id
		final String password = uloginBean.getU_pw(); // 네이버 pw
		int port = 465;

		String recipient = "ok980621@gmail.com"; // 메일 받을 주소
		String subject = req.getParameter("subject");// 메일제목
		String text = req.getParameter("text");// 메일 내용

		Properties props = System.getProperties(); // 프로퍼티 객체 생성

		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		// 세선만들기
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); // 디버그

		Message myMessage = new MimeMessage(session);
		myMessage.setFrom(new InternetAddress(uloginBean.getU_id() + "@naver.com")); // 발신자 전체 이메일주소
		myMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자 전체 이메일

		myMessage.setSubject(subject); // 제목셋팅
		myMessage.setText(text); // 내용셋팅
		Transport.send(myMessage); // 메일 보내기

		return "user/1on1suc";
	}

}
