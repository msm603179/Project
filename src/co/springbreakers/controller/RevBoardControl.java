package co.springbreakers.controller;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.review_board;
import co.springbreakers.beans.review_board_page;
import co.springbreakers.mapper.RevBoardMapper;
import co.springbreakers.servies.ImgServie;
import co.springbreakers.servies.RevServie;

@Controller
@RequestMapping(value = "board")
public class RevBoardControl {
   
   @Resource(name = "uloginBean")
   private Pc_user uloginBean; //세션 pc_user
   
   @Resource(name = "mloginBean")
   private Pc_maneger mloginbean;
   
   @Autowired
   RevBoardMapper map;
   
   @Autowired
   RevServie ser;
   
   @Autowired
   ImgServie iser;
   
   @RequestMapping(value = "revwrite")
   public String bowrite2(review_board re) {
      
      if(uloginBean.getU_id()==null) {
         re.setId(mloginbean.getM_id());
      }else {
         re.setId(uloginBean.getU_id());
      }
      
      int ref=ser.maxref();
      
      if(re==null) {
         re.setRef(0);
      }else {
         re.setRef(ref+1);   
      }
      ser.inrev(re);
      
      return "forward:/board/revboardlist";
   }
   
   @RequestMapping(value = "revboardlist")
   public String bolist(review_board_page rep, Model mo, review_board re
	         , @RequestParam(value="nowpage", required=false)String nowpage
	         , @RequestParam(value="cntperpage", required=false)String cntperpage
	         , @RequestParam(value = "pc_name") String pc_name) {
	      
	      int total = map.bocount();
	      
	      if (nowpage == null && cntperpage == null) {
	         nowpage = "1";
	         cntperpage = "10";
	      } else if (nowpage == null) {
	         nowpage = "1";
	      } else if (cntperpage == null) { 
	         cntperpage = "10";
	      }
	      rep = new review_board_page(total, Integer.parseInt(nowpage), Integer.parseInt(cntperpage));
      
      if(mloginbean.getM_id() == null) {
   			mo.addAttribute("check", 2);
   		} else if(uloginBean.getU_id() == null) {
   			mo.addAttribute("check", 1);
   		}
   	   
      
      if(uloginBean.getU_id()==null) {
         re.setId(mloginbean.getM_id());
         mo.addAttribute("id", re.getId());
      } else {
         re.setId(uloginBean.getU_id());
         mo.addAttribute("id", re.getId());
      }
      
      mo.addAttribute("paging", rep);
      mo.addAttribute("lre", ser.allboarddb(rep));
      mo.addAttribute("pc_name", pc_name);
      mo.addAttribute("img", iser.getpath("등록1배경"));
      
      mo.addAttribute("pc1", iser.getpath(pc_name+"pc1"));
      mo.addAttribute("pc2", iser.getpath(pc_name+"pc2"));
      mo.addAttribute("pc3", iser.getpath(pc_name+"pc3"));
      mo.addAttribute("pc4", iser.getpath(pc_name+"pc4"));
      mo.addAttribute("side", iser.getpath("사이드버튼"));
      
      
      
      return "board/revboardlist";
   }
   
   

}