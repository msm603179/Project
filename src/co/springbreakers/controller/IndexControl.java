package co.springbreakers.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.pc_time;
import co.springbreakers.mapper.CreatePcMapper;
import co.springbreakers.mapper.Pc_timeMapper;
import co.springbreakers.servies.ImgServie;

@Controller
public class IndexControl {
	
	@Resource(name = "uloginBean")
	private Pc_user uloginBean; 
	
	@Resource(name = "mloginBean")
	private Pc_maneger mloginbean;
	
	@Autowired
	CreatePcMapper createmap;
	
	@Autowired
	Pc_timeMapper map;

	
	@Autowired
	ImgServie iser;

	@RequestMapping(value = "/")
	public String rootpage(Model model) {
		
		model.addAttribute("logimg", iser.getpath("메인일반"));
		model.addAttribute("logimg2", iser.getpath("메인가맹"));
		
		return "main";
	}
	
	@RequestMapping(value = "logout")
	public String logout() {
		return "logout";
	}
	
	@GetMapping("pc_enrol/pc_enrol2")
	public String en() {
		return "pc_enrol/pc_enrol2";
	}
	
	@RequestMapping(value = "include/side")
	public String side() {
		
		return "include/side";
	}
	
	@RequestMapping(value = "pc_enrol4")
	   public String enrol4(HttpServletRequest req, @RequestParam("pc_name") String name,Model mo) {
		
		
		if(mloginbean.getM_id() == null) {
			mo.addAttribute("check", 2);
		} else if(uloginBean.getU_id() == null) {
			mo.addAttribute("check", 1);
		}
		
		pc_time pct = map.str(name);
	      
	      
	      String uname=uloginBean.getU_name();
	      String uid=uloginBean.getU_id();
	      
	      String[] timet = pct.getPc_time_text().split(",");
	      String[] time = pct.getPc_time().split(",");
	      String[] timep = pct.getPc_time_price().split(",");
	      
	      
	      String sql1="select NVL(max(time),'0') from pc_"+name+"_time where name='"+uname+"'";
	      

	      String sqltime=createmap.pcuinfo(sql1);
	      
	      int ti=Integer.parseInt(sqltime);
	      
	      int sec=ti%60;
	      int min=ti/60;
	      int hour=min/60;
	      min = min%60;
	      
	      
	      String shour=Integer.toString(hour);
	      String smin=Integer.toString(min);
	      String ssec=Integer.toString(sec);
	      
	      String utime=shour+":"+smin+":"+ssec;
	      
	      
	      req.setAttribute("uname", uname);
	      req.setAttribute("uid", uid);
	      req.setAttribute("utime", utime);
	      
	      req.setAttribute("timet", timet);
	      req.setAttribute("time", time);
	      req.setAttribute("timep", timep);
	      req.setAttribute("name", name);
	      req.setAttribute("chrimg", iser.getpath("등록1배경"));
	      mo.addAttribute("side", iser.getpath("사이드버튼"));
	      
	      mo.addAttribute("pc_name", name);
	      return "pc_enrol4";
	   }

	
	@RequestMapping(value = "credit")
	public String credit(@RequestParam("timet") String timet,@RequestParam("time") String time,@RequestParam("timep") String timep,@RequestParam("name") String name, Model mo) {
		mo.addAttribute("timet", timet);
		mo.addAttribute("time", time);
		mo.addAttribute("timep", timep);
		mo.addAttribute("name", name);

		return "credit";
	}
	
	@RequestMapping(value = "credit2")
	public String credit2(@RequestParam("timet") String timet,@RequestParam("time") String time,@RequestParam("timep") String timep,@RequestParam("name") String name, Model mo) {
		mo.addAttribute("timet", timet);
		mo.addAttribute("time", time);
		mo.addAttribute("timep", timep);
		mo.addAttribute("name", name);
		
		
		return "credit2";
	}
	
	
	@RequestMapping(value = "creditsel")
	public String creditsel(@RequestParam("timet") String timet,@RequestParam("time") String time,@RequestParam("timep") String timep,@RequestParam("name") String name, Model mo ) {
		mo.addAttribute("timet", timet);
		mo.addAttribute("time", time);
		mo.addAttribute("timep", timep);
		mo.addAttribute("name", name);
		
		mo.addAttribute("cacao", iser.getpath("카카오페이"));
		mo.addAttribute("ini", iser.getpath("이니시스"));
		
		return "creditsel";
	}
		
	@RequestMapping(value = "creditsuc")
	public String creditsuc(@RequestParam("timet") String timet,@RequestParam("time") String time,@RequestParam("timep") String timep,@RequestParam("name") String name) {
		
		String uname=uloginBean.getU_name();	
		
		String selsql="select NVL(max(name),'no') from pc_"+name+"_time where name="+"'"+ uname+"'" ;
		
		
		
		int timeset = Integer.parseInt(time) * 60;
		
		String usercheck="select NVL(max(u_id),'no') from "+name+"_user_time where u_id="+"'"+ uloginBean.getU_id()+"'" ;
		
		if(createmap.selname(usercheck).equals("no")) {
			String userinsert = "insert into " + name + "_user_time values('" + uloginBean.getU_id() + "', '" + timeset + "')";
			
			map.userinsert(userinsert);
		} else {
			String usertimeup = "update " + name + "_user_time set time = time + " + timeset + " where u_id = '" + uloginBean.getU_id() +"'"; 
			
			map.usertimeup(usertimeup);
		}
		
		
		int timeint = Integer.parseInt(time) * 60;
		
		if(createmap.selname(selsql).equals("no")) {
			String sql = "insert into pc_" + name + "_time(paydate,name,time,price)values(sysdate, '" +uname+"','"+timeset+"','"+timep+ "')";		
		    createmap.inserttime(sql);	
		    
		} else {
			String insql="update pc_"+name+"_time set time=time+"+timeint+",price=price+"+timep;
			createmap.uptime(insql);
			
		}
		
		return "creditsuc";
	}
	
	
	
}
