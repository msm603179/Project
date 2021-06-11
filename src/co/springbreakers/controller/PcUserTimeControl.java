package co.springbreakers.controller;

import java.util.Arrays;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.springbreakers.beans.Pc_user;
import co.springbreakers.mapper.PcUserTimeMapper;

@Controller
@RequestMapping("/pcmain")
public class PcUserTimeControl {

	@Autowired
	PcUserTimeMapper timemap;

	@Resource(name = "uloginBean")
	private Pc_user uloginBean;

	@GetMapping("/selectuse")
	public String use(@RequestParam("pc_name") String pc_name, @RequestParam("tableid") String tableid, @RequestParam("data") String data, Model model) {

		model.addAttribute("pc_name", pc_name);
		model.addAttribute("tableid", tableid);

		String usechecksql = "select " + tableid + " from pc_" + pc_name + "_table where " + tableid + " like '%" + uloginBean.getU_id() + "%'";
		String otherusechecksql = "select " + tableid + " from pc_" + pc_name + "_table where " + tableid + " like '% %'";


		if (timemap.usecheck(usechecksql) != null) {
			String[] time = data.substring(data.indexOf(">") + 1, data.length()).split(":");
			
			System.out.println(Arrays.toString(time));
			
			int timeset = (Integer.parseInt(time[0]) * 3600) + (Integer.parseInt(time[1]) * 60) + Integer.parseInt(time[2]);
			
			String timesetsql = "update " + pc_name +"_user_time set time = '" + timeset + "' where u_id = '" + uloginBean.getU_id() +"'";
			
			String timesetsql2 = "update pc_"+pc_name+"_time set time = '"+timeset+"' where name = '" +uloginBean.getU_name() +"'";
			
			timemap.timeset(timesetsql);
			timemap.timeset(timesetsql2);
			
			return "pcmain/useend";
		} else {
			try {
				timemap.usecheck(otherusechecksql).contains(" ");
			} catch (Exception e) {
				return "pcmain/nobnob";
			}

			String usertime;

			String sql = "select time from " + pc_name + "_user_time where u_id = '" + uloginBean.getU_id() + "'";

			try {
				usertime = timemap.useTimeCheck(sql);
			} catch (Exception e) {
				return "pcmain/timeerror";
			}

			model.addAttribute("usertime", usertime);

			return "pcmain/selectuse";
		}
	}

	@GetMapping("/useenrol")
	public String useenrol(@RequestParam("pc_name") String pc_name, @RequestParam("tableid") String tableid,
			Model model) {

		String change = uloginBean.getU_id();

		if (change == null) {
			return "";
		}

		String timesql = "select time from " + pc_name + "_user_time where u_id = '" + uloginBean.getU_id() + "'";

		String time = timemap.useTimeCheck(timesql);

		String updatesql = "update pc_" + pc_name + "_table set " + tableid + " = '" + tableid + "-" + change + "-"
				+ time + "'";

		timemap.change(updatesql);

		model.addAttribute("pc_name", pc_name);
		model.addAttribute("tableid", tableid);

		return "redirect:pc_main1";
	}

	@GetMapping("/end")
	public String useend(@RequestParam("pc_name") String pc_name, @RequestParam("tableid") String tableid,
			Model model) {

		String sql = "update pc_" + pc_name + "_table set " + tableid + " = '" + tableid + "- - '";
		
		
		
		
		timemap.useend(sql);

		// +++++ 가_time??? 시간 수정.. 스크립트 값 받아와서
		
		model.addAttribute("pc_name", pc_name);

		return "redirect:pc_main1";
	}
}
