package co.springbreakers.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.springbreakers.beans.Pc_Sales;
import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.SalesData;
import co.springbreakers.beans.Zip;
import co.springbreakers.mapper.Manegermapper;
import co.springbreakers.servies.ImgServie;
import co.springbreakers.servies.Manegerservie;
import co.springbreakers.servies.Userservie;
import co.springbreakers.validation.validate2;
import net.sf.json.JSONArray;


@Controller
@RequestMapping("maneger")
//유저 관련 컨트롤러
public class ManegerControl {
	
	@Autowired
	Manegermapper map;
	
	@Autowired
	Manegerservie manegerv;
	
	@Autowired
	Userservie userv;
	
	@Autowired
	ImgServie iser;
	
	@Resource(name = "mloginBean")
	private Pc_maneger mloginbean;
	
	//회원가입
	@GetMapping(value = "/inmaneger")
	public String inmaneger(Pc_maneger maneger, Model model) {
		
		model.addAttribute("inuserbackimg", iser.getpath("유저가입배경"));
		
		return "maneger/inmaneger";
	}
	
	@InitBinder("pc_maneger")
	public void InitBinder2(WebDataBinder binder) {
		validate2 v2 = new validate2();
		
		binder.addValidators(v2);
	}
	
	
	//회원가입 동작
	@RequestMapping(value = "/inman")
	public String inman(@Valid Pc_maneger maneger,BindingResult re, Model model) {
		
		//가맹점주 아이디 중복 or 일반회원 아이디 중복될 경우 fail 페이지로 이동
		if(userv.userupli(maneger.getM_id()) != null || manegerv.manupli(maneger.getM_id()) != null) {
			model.addAttribute("inuserbackimg", iser.getpath("유저가입배경"));
			return "maneger/m_inmaneger_fail";
		}
		
		if(re.hasErrors()) {
			model.addAttribute("inuserbackimg", iser.getpath("유저가입배경"));
			return "maneger/inmaneger";
		}
		
		manegerv.manegerin(maneger);
		return "maneger/m_inmaneger_suc"; //가입 성공 여부
	}
	
	@RequestMapping(value = "/upman")//회원 정보 수정 유효성검사 안됨 나중에 바꿔야댐
	public String upman(String m_id,HttpServletRequest req) {
		
		Pc_maneger man=manegerv.manupli(m_id);
		
		req.setAttribute("man", man);
		
		
		return "forward:/maneger/upmaneger";
	}
	
	@RequestMapping( value = "/upmaneger")//회원 정보 수정 동작
	public String upmaneger( Pc_maneger man,HttpServletRequest req) {
		  man=(Pc_maneger) req.getAttribute("man");
		 
	
		
		return "maneger/upmaneger";
	}
	
	@RequestMapping( value = "/upmango") //유효성검사안댐
	public String upusego(@ModelAttribute("man") @Valid Pc_maneger maneger,BindingResult re) {
		if(re.hasErrors()) {
			return "maneger/upmaneger";
		}
		manegerv.manup(maneger);
		
		
		return "maneger/m_upman_suc";
	}
	
	@RequestMapping(value = "/addr") //주소 관련페이지
	public String zipsearch(Zip zip,Model mo) {
		List<Zip> zip2=manegerv.zipsearch(zip);
		mo.addAttribute("zip2",zip2);
		List<String> addrli = new ArrayList<>(); 
		for(int i=0; i<zip2.size(); i++) {
			Zip str=zip2.get(i);
			
			String exaddr=str.getArea1()+str.getArea2()+str.getArea3();
			String addr = exaddr.replaceAll(" ","");

			addrli.add(addr);
		}
		mo.addAttribute("addrli", addrli);
		
		return "maneger/addr";
	}
	
	//유저 로그인
	@RequestMapping(value = "m_login")
	public String login(Pc_maneger man,Model mo) {
		mo.addAttribute("logimg", iser.getpath("가맹"));
		return "maneger/m_login";
	}
	
	//로그인 동작
	@RequestMapping(value = "m_log") //없는 아이디일 경우 에러페이지 추가 (나중에)
	public String ulog(Pc_maneger man, Model model) {
		
	man.setMidchk(manegerv.midchk(man.getM_id()));
		System.out.println(man.isMidchk());
		if(man.isMidchk()==false) {
			return "maneger/m_log_fail";
		}else {
			String dbpw=manegerv.selm_pw(man);
			
			if(dbpw.equals(man.getM_pw())) {
			man=manegerv.manupli(man.getM_id());
			
			mloginbean.setPc_manegerLogin(true);
			mloginbean.setM_join_date(man.getM_join_date());
			mloginbean.setPc_name(man.getPc_name());
			mloginbean.setPc_b_number(man.getPc_b_number());
			mloginbean.setM_name(man.getM_name());
			mloginbean.setM_id(man.getM_id());
			mloginbean.setM_pw(man.getM_pw());
			mloginbean.setM_birthday(man.getM_birthday());
			mloginbean.setM_phone(man.getM_phone());
			mloginbean.setPc_address(man.getPc_address());
			mloginbean.setM_email(man.getM_email());
			mloginbean.setPc_enrol(man.getPc_enrol());
			
			if(man.getPc_enrol().equals("N")){
				model.addAttribute("pc_name", man.getPc_name());
				model.addAttribute("side",iser.getpath("사이드버튼"));
				return "maneger/m_log_suc";
			} else {
				model.addAttribute("pc_name", man.getPc_name());
				model.addAttribute("side",iser.getpath("사이드버튼"));
				return "maneger/m_log_suc2";
			}
			
			
			
			}else {
			return "maneger/m_log_fail";
		}
		}
		
	}
	
	@RequestMapping(value = "m_not_login")
	public String m_not_login() {
		return "maneger/m_not_login";
	}
	
	//아이디 찾기
	@RequestMapping(value = "m_id_find")
	public String idfind(Pc_maneger man) {
		
		return "maneger/m_id_find";
	}
	
	//아이디 찾기
	@RequestMapping(value = "m_id_findrun")
	public String idfindrun(Pc_maneger man,HttpServletRequest req) {
		String id=manegerv.findm_id(man);
		if(id!=null) {
			req.setAttribute("id", id);
		return "maneger/m_id_findrun";
		
		}else {
			return "maneger/m_id_find";
		}
		
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "m_pw_find")
	public String pwfind(Pc_maneger man) {
		
		return "maneger/m_pw_find";
	}
	
	//아이디 찾기
	@RequestMapping(value = "m_pw_findrun")
	public String pwfindrun(Pc_maneger man,HttpServletRequest req) {
		String pw=manegerv.findm_pw(man);
		if(pw!=null) {
			req.setAttribute("pw", pw);
		return "maneger/m_pw_findrun";
		
		}else {
			return "maneger/m_pw_find";
		}
		
	}
	
	@RequestMapping(value ="m_main" )
	public String umain(Model mo) {
		
		mo.addAttribute("id",mloginbean.getM_id()); 
		mo.addAttribute("idt", "m_id");
		mo.addAttribute("upd", "maneger/upman");
		mo.addAttribute("enrol", "pc_enrol/pc_enrol1");
		mo.addAttribute("qa", "board/qaboardlist");
		mo.addAttribute("rev", "board/revboardlist");
		mo.addAttribute("mail", "maneger/m_main");
		return "maneger/m_main";
	}
	
	
	@GetMapping("/salesdata")
	public String erp(@RequestParam("month") String month, Model model) {
		
		int monthint = Integer.parseInt(month.substring(0,1));
		
		System.out.println(monthint);
		
		if(monthint < 10) {
			//select to_char(paydate, 'dd') as paydate, sum(price) from pc_솔데스크피시방_time where paydate like '21/01/%' group by paydate;
			String salessql ="select to_char(paydate, 'dd') as paydate, sum(price) as price from pc_"+ mloginbean.getPc_name() + "_time where paydate like '21/0" + monthint + "/%' group by paydate order by paydate asc";
			
			List<SalesData> salessearch = map.salesData(salessql);
			model.addAttribute("salessearch", salessearch);
			
			
		} else {
			String salessql ="select to_char(paydate, 'dd') as paydate, sum(price) as price from pc_"+ mloginbean.getPc_name() + "_time where paydate like '21/" + monthint + "/%' group by paydate order by paydate asc";
			
			List<SalesData> salessearch = map.salesData(salessql);
			model.addAttribute("salessearch", salessearch);
			
			
		}
		
		
		
		List<String> saleslist = new ArrayList<String>();
		
		for(int i = 1; i < 13; i++) {
			if(i < 10) {
				
				String sql = "select sum(price) from pc_"+ mloginbean.getPc_name() +"_time where paydate like '21/0" + i + "/%'";
				saleslist.add(map.totalSales(sql));
			} else {
				String sql = "select sum(price) from pc_"+ mloginbean.getPc_name() +"_time where paydate like '21/"+ i +"/%'";
				saleslist.add(map.totalSales(sql));
			}
		}
		
		
		
		JSONArray jsonArray = new JSONArray();
		
		model.addAttribute("jsonlist", jsonArray.fromObject(saleslist));
		model.addAttribute("pc_name", mloginbean.getPc_name());
		
		model.addAttribute("month", month);
		
		return "maneger/salesdata";
	}

}
