package co.springbreakers.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.springbreakers.beans.Pc_Main1;
import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.pc_time;
import co.springbreakers.mapper.PcMapper;
import co.springbreakers.servies.ImgServie;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/pcmain")
public class PcControl {

	@Autowired
	PcMapper pcmap;
	
	@Resource(name = "mloginBean")
	private Pc_maneger mloginBean;
	
	@Resource(name = "uloginBean")
	private Pc_user uloginBean;
	
	@Autowired
	ImgServie iser;
	
	@GetMapping("/pc_main1")
	public String pc(@RequestParam("pc_name") String pc_name, Model model) {
			
			if(mloginBean.getM_id() == null) {
				model.addAttribute("check", 2);
			} else if(uloginBean.getU_id() == null) {
				model.addAttribute("check", 1);
			}
			
			
			String pcname = mloginBean.getPc_name();
			if(pcname == null) {
				pcname = pc_name;
			}
			
			String resultsql = "select pc_name||','||pc_b_number||','||numcol||','||numrow||','||checktable";
			
			String colums_count_sql = "SELECT COUNT(*) FROM USER_TAB_COLUMNS WHERE TABLE_NAME = upper('pc_"+pcname+"_table')";
			
			String datasql = "select checktable from pc_"+pcname+"_table";
			
			String[] data = pcmap.data(datasql).split("-");
			
			
			
			for(int i = 0; i < data.length; i++) {
				if(i == data.length - 1) {
					resultsql += "||','||" + data[i] + " from pc_" + pcname + "_table";
				} else {
					resultsql += "||','||" + data[i];
				}
			}
			
			String[] result = pcmap.pc_result(resultsql).split(",");
			
			
			
			String[] checktable = result[4].split("-");
			ArrayList<String> alltable = new ArrayList<String>();
			
			int numcol = Integer.parseInt(result[2]);
			int numrow = Integer.parseInt(result[3]);
			
			for(int i = 0; i < numcol; i++) {
				for(int j = 0; j < numrow; j++) {
					alltable.add("t"+i+"_"+j);
				}
			}
			
			
			List<Pc_Main1> pcmainlist = new ArrayList<Pc_Main1>();
			
			for(int i = 5; i < result.length; i++) {
				String[] splitdata = result[i].split("-");
				
				System.out.println(Arrays.toString(splitdata));
				
				Pc_Main1 pcmain = new Pc_Main1(splitdata[0], splitdata[1], splitdata[2]);
				pcmainlist.add(pcmain);
			}
			
			JSONArray jsonArray = new JSONArray();
			
			
			model.addAttribute("pc_name",result[0]);
			model.addAttribute("pc_b_number", result[1]);
			model.addAttribute("numcol", numcol);
			model.addAttribute("numrow", numrow);
			model.addAttribute("checktable", checktable);
			model.addAttribute("alltable", alltable);
			model.addAttribute("jsonList", jsonArray.fromObject(pcmainlist));
			model.addAttribute("pcmain1",iser.getpath("등록1배경"));
			model.addAttribute("side", iser.getpath("사이드버튼"));
			model.addAttribute("id",uloginBean.getU_id());
			model.addAttribute("idt", "u_id");
			model.addAttribute("upd", "user/upuse");
			model.addAttribute("qa", "board/qaboardlist");
			
			
			return "pcmain/pc_main1";
		}
	

	@RequestMapping(value = "/pc_maincategory")
	public String category(@RequestParam("category") String category, @RequestParam("pc_name") String pc_name ,Model model) {
		
		if(mloginBean.getM_id() == null) {
			model.addAttribute("check", 2);
		} else if(uloginBean.getU_id() == null) {
			model.addAttribute("check", 1);
		}
		
		model.addAttribute("pc_name", pc_name);
		
		if(category.equals("cafe")) {
			String sql="select pc_food_path from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='카페'";
			String sql1="select pc_food_name from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='카페'";
			String sql2="select pc_food_price from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='카페'";
			
			List<String> cafe=pcmap.getfoodpath(sql);
			List<String> cafen=pcmap.getfoodpath(sql1);
			List<String> cafep=pcmap.getfoodpath(sql2);
			
			for(int i=0; i<cafe.size(); i++) {
				model.addAttribute("food"+i, cafe.get(i));
				model.addAttribute("foodn"+i, cafen.get(i));
				model.addAttribute("foodp"+i, cafep.get(i));
				model.addAttribute("pc_name", pc_name);
				model.addAttribute("side", iser.getpath("사이드버튼"));
			}
		} else if(category.equals("drink")) {
			String sql="select pc_food_path from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='음료'";
			String sql1="select pc_food_name from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='음료'";
			String sql2="select pc_food_price from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='음료'";
			
			List<String> drink=pcmap.getfoodpath(sql);
			List<String> drinkn=pcmap.getfoodpath(sql1);
			List<String> drinkp=pcmap.getfoodpath(sql2);
			
			for(int i=0; i<drink.size(); i++) {
				model.addAttribute("food"+i, drink.get(i));
				model.addAttribute("foodn"+i, drinkn.get(i));
				model.addAttribute("foodp"+i, drinkp.get(i));
				model.addAttribute("pc_name", pc_name);
				model.addAttribute("side", iser.getpath("사이드버튼"));
			}
		}else if(category.equals("siksa")) {
			String sql="select pc_food_path from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='식사류'";
			String sql1="select pc_food_name from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='식사류'";
			String sql2="select pc_food_price from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='식사류'";
			
			List<String> siksa=pcmap.getfoodpath(sql);
			List<String> siksan=pcmap.getfoodpath(sql1);
			List<String> siksap=pcmap.getfoodpath(sql2);
			
			for(int i=0; i<siksa.size(); i++) {
				model.addAttribute("food"+i, siksa.get(i));
				model.addAttribute("foodn"+i, siksan.get(i));
				model.addAttribute("foodp"+i, siksap.get(i));
				model.addAttribute("pc_name", pc_name);
				model.addAttribute("side", iser.getpath("사이드버튼"));
			}
		}else if(category.equals("lamen")) {
			String sql="select pc_food_path from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='라면'";
			String sql1="select pc_food_name from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='라면'";
			String sql2="select pc_food_price from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='라면'";
			
			List<String> lamen=pcmap.getfoodpath(sql);
			List<String> lamenn=pcmap.getfoodpath(sql1);
			List<String> lamenp=pcmap.getfoodpath(sql2);
			
			for(int i=0; i<lamen.size(); i++) {
				model.addAttribute("food"+i,  lamen.get(i));
				model.addAttribute("foodn"+i, lamenn.get(i));
				model.addAttribute("foodp"+i, lamenp.get(i));
				model.addAttribute("pc_name", pc_name);
				model.addAttribute("side", iser.getpath("사이드버튼"));
			}
		}else if(category.equals("gansik")) {
			String sql="select pc_food_path from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='간식류'";
			String sql1="select pc_food_name from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='간식류'";
			String sql2="select pc_food_price from pc_table_food where pc_name='"+pc_name+"' and pc_food_category='간식류'";
			
			List<String> gansik=pcmap.getfoodpath(sql);
			List<String> gansikn=pcmap.getfoodpath(sql1);
			List<String> gansikp=pcmap.getfoodpath(sql2);
			
			for(int i=0; i<gansik.size(); i++) {
				System.out.println(gansik.get(i));
				model.addAttribute("food"+i, gansik.get(i));
				model.addAttribute("foodn"+i, gansikn.get(i));
				model.addAttribute("foodp"+i, gansikp.get(i));
				model.addAttribute("pc_name", pc_name);
				model.addAttribute("side", iser.getpath("사이드버튼"));
			}

		}
		
		model.addAttribute("categoryimg",iser.getpath("등록1배경"));
		model.addAttribute("side", iser.getpath("사이드버튼"));
		model.addAttribute("de", iser.getpath("대체사진"));
		
		return "pcmain/pc_maincategory";
	}
	
	
}
