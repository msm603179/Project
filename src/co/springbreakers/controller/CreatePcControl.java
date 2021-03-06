package co.springbreakers.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.pc_time;
import co.springbreakers.mapper.CreatePcMapper;
import co.springbreakers.mapper.Pc_timeMapper;
import co.springbreakers.servies.CreatePcLoadServies;
import co.springbreakers.servies.ImgServie;

@Controller
@RequestMapping("pc_enrol")
public class CreatePcControl {

	@Autowired
	CreatePcLoadServies imgservies;

	@Autowired
	ImgServie iser;

	@Autowired
	CreatePcMapper createmap;

	@Autowired
	Pc_timeMapper map;

	@Autowired
	SqlSessionFactory sqlMapper;

	@Resource(name = "mloginBean")
	private Pc_maneger mloginbean;

	@GetMapping("/imgin")
	public String imgpage() {
		return "imgup/imgpage";
	}

	@PostMapping("/createenrol1")
	public String createenrol1(@RequestParam("checkval") String checkval, @RequestParam("numcol") String numcol,
			@RequestParam("numrow") String numrow, Model model) {

		String[] valueary = checkval.split("-");

		String pcname = mloginbean.getPc_name();
		String pcbnum = mloginbean.getPc_b_number();

		String sql = "create table pc_" + pcname
				+ "_table(pc_name varchar2(100) not null, pc_b_number varchar2(10) not null primary key,"
				+ "numcol varchar2(10) not null, numrow varchar2(10) not null, checktable varchar2(2000) not null,";

		String sql2 = "insert into pc_" + pcname + "_table(pc_name, pc_b_number, numcol, numrow, checktable) "
				+ "values('" + pcname + "', '" + pcbnum + "', '" + numcol + "', '" + numrow + "', '" + checkval + "')";

		for (int i = 0; i < valueary.length; i++) {
			if (i == valueary.length - 1) {
				sql += valueary[i] + " varchar2(200) default '" + valueary[i] + "- - ')";
			} else {
				sql += valueary[i] + " varchar2(200) default '" + valueary[i] + "- - ', ";
			}
		}

		
		createmap.createenrol1(sql);

		createmap.tableFirstInsert(sql2);

		model.addAttribute("logo", iser.getpath("??????"));
		model.addAttribute("pc_enrol1_backgroundimg", iser.getpath("??????1??????"));
		model.addAttribute("side", iser.getpath("???????????????"));
		
		return "pc_enrol/pc_enrol2";
	}

	@PostMapping("/foodimgenrol")
	public String foodimgenrol(@RequestParam("pc_food_category") String pc_food_category, Model model,
			@RequestParam("pc_food_name") String pc_food_name, @RequestParam("pc_food_price") String pc_food_price,
			HttpServletRequest request) throws IOException {

		String[] category = pc_food_category.split(",");
		String[] foodname = pc_food_name.split(",");
		String[] foodprice = pc_food_price.split(",");

		// request ?????????(??????????????????) MultipartHttpServletRequest??? ??????.
		// ???????????? MultipartResolver ?????? ????????????.
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

		// request ????????? ????????? file ????????? ??????????????? ????????? ??????
		List<MultipartFile> file = multi.getFiles("file");

		// ?????? ???????????? ????????? ??????
		String path = "";

		if (file != null) {

			for (int i = 0; i < file.size(); i++) {
				System.out.println("???????????????" + file.get(i).getName());
				System.out.println("????????????" + file.get(i).getSize());
				System.out.println("?????? ??????" + file.get(i).isEmpty());
				System.out.println("???????????? ?????? ??????" + file.get(i).getOriginalFilename());
			}
			path = "C:/Users/82109/eclipse-workspace2/Spring_project/WebContent/WEB-INF/img/";
			InputStream inputStream = null;
			OutputStream outputStream = null;

			// ???????????? + ?????? ?????? ??????
			String organizedfilePath = "";

			try {

				String pc_name = mloginbean.getPc_name();
				String pc_b_number = mloginbean.getPc_b_number();

				int readByte = 0;
				byte[] buffer = new byte[8192];

				for (int k = 0; k < category.length; k++) {
					// ????????? ???????????? ??????.
					UUID randomeUUID = UUID.randomUUID();

					if (file.get(k).getSize() > 0) {
						inputStream = file.get(k).getInputStream();

						// path??? ????????? ????????? ????????? ????????? ????????????
						File realUploadDir = new File(path);

						if (!realUploadDir.exists()) {
							realUploadDir.mkdirs();// ????????????.
						}
					}

					// ???????????? + ???????????? + ?????? ?????? ??????
					organizedfilePath = path + randomeUUID + "_" + file.get(k).getOriginalFilename();
					System.out.println(organizedfilePath);

					// ???????????? + ???????????? + ?????? ????????? FileoutputStream?????? ?????????.
					outputStream = new FileOutputStream(organizedfilePath);

					while ((readByte = inputStream.read(buffer, 0, 8120)) != -1) {
						outputStream.write(buffer, 0, readByte); // ?????? ?????? !

					}

					pc_food_category = category[k];
					pc_food_name = foodname[k];
					pc_food_price = foodprice[k];
					String pc_food_path = randomeUUID + "_" + file.get(k).getOriginalFilename();
					imgservies.inpath(pc_name, pc_b_number, pc_food_category, pc_food_name, pc_food_price,
							pc_food_path);
				}

			} catch (Exception e) {
				e.printStackTrace();

			} finally {

				outputStream.close();
				inputStream.close();
			}

		}
		pc_time pc_time = new pc_time();

		pc_time.setPc_name(mloginbean.getPc_name());
		pc_time.setPc_b_number(mloginbean.getPc_b_number());
		
		model.addAttribute("logo", iser.getpath("??????"));
		model.addAttribute("pc_enrol1_backgroundimg", iser.getpath("??????1??????"));
		model.addAttribute("manegerlogo", iser.getpath("??????"));
		model.addAttribute("pc_time" ,pc_time);
		model.addAttribute("pc_name" ,mloginbean.getPc_name());
		
		return "pc_enrol/pc_enrol3";
	}

	@RequestMapping(value = "pc_enrol1")
	public String enrol1(Model model) {
		
		
		model.addAttribute("logo", iser.getpath("??????"));
		model.addAttribute("pc_enrol1_backgroundimg", iser.getpath("??????1??????"));
		
		return "pc_enrol/pc_enrol1";
	}

	@RequestMapping(value = "pc_enrol2")
	public String enrol2(Model model) {

		model.addAttribute("pc_enrol1_backgroundimg", iser.getpath("??????1??????"));
		model.addAttribute("side", iser.getpath("???????????????"));
		model.addAttribute("logo", iser.getpath("??????"));
		
		
		return "pc_enrol/pc_enrol2";
	}

	@RequestMapping(value = "pc_enrol3")
	public String enrol3(Model mo, pc_time pct, HttpServletRequest request) {

		mo.addAttribute("logo", iser.getpath("??????"));
		mo.addAttribute("manegerlogo", iser.getpath("????????????"));
		mo.addAttribute("pc_enrol1_backgroundimg", iser.getpath("??????1??????"));
		mo.addAttribute("pc_name", mloginbean.getPc_name());
		mo.addAttribute("pc_b_number", mloginbean.getPc_b_number());

		return "pc_enrol/pc_enrol3";
	}

	@RequestMapping(value = "pc_enrolin")
	public String enrolin(pc_time pct, Model mo, HttpServletRequest request) throws IOException {
		String pcname = mloginbean.getPc_name();
		String pcbnum = mloginbean.getPc_b_number();

		
		List<String> iden = new ArrayList<>();
		iden.add(request.getParameter("iden1"));
		iden.add(request.getParameter("iden2"));
		iden.add(request.getParameter("iden3"));
		iden.add(request.getParameter("iden4"));

		

		// request ?????????(??????????????????) MultipartHttpServletRequest??? ??????.
		// ???????????? MultipartResolver ?????? ????????????.
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

		// request ????????? ????????? file ????????? ??????????????? ????????? ??????
		List<MultipartFile> file = multi.getFiles("file");

		// ?????? ???????????? ????????? ??????
		String path = "";

		if (file != null) {

			for (int i = 0; i < file.size(); i++) {
				System.out.println("???????????????" + file.get(i).getName());
				System.out.println("????????????" + file.get(i).getSize());
				System.out.println("?????? ??????" + file.get(i).isEmpty());
				System.out.println("???????????? ?????? ??????" + file.get(i).getOriginalFilename());
			}
			path = "C:/Users/82109/eclipse-workspace2/Spring_project/WebContent/WEB-INF/img/";
			InputStream inputStream = null;
			OutputStream outputStream = null;

			// ???????????? + ?????? ?????? ??????
			String organizedfilePath = "";

			try {

				String pc_name = mloginbean.getPc_name();
				String pc_b_number = mloginbean.getPc_b_number();

				int readByte = 0;
				byte[] buffer = new byte[8192];

				for (int k = 0; k < iden.size(); k++) {
					// ????????? ???????????? ??????.
					UUID randomeUUID = UUID.randomUUID();

					if (file.get(k).getSize() > 0) {
						inputStream = file.get(k).getInputStream();

						// path??? ????????? ????????? ????????? ????????? ????????????
						File realUploadDir = new File(path);

						if (!realUploadDir.exists()) {
							realUploadDir.mkdirs();// ????????????.
						}
					}

					// ???????????? + ???????????? + ?????? ?????? ??????
					organizedfilePath = path + randomeUUID + "_" + file.get(k).getOriginalFilename();
					System.out.println(organizedfilePath);

					// ???????????? + ???????????? + ?????? ????????? FileoutputStream?????? ?????????.
					outputStream = new FileOutputStream(organizedfilePath);

					while ((readByte = inputStream.read(buffer, 0, 8120)) != -1) {
						outputStream.write(buffer, 0, readByte); // ?????? ?????? !

					}
					String name = iden.get(k);
					String pathname = randomeUUID + "_" + file.get(k).getOriginalFilename();
					iser.inpath(name, pathname);
				}

			} catch (Exception e) {
				e.printStackTrace();

			} finally {

				outputStream.close();
				inputStream.close();
			}

		}

		String sql = "create table pc_" + pcname + "_time(paydate date, name varchar2(50) not null, time varchar2(20) not null,"
				+ "price varchar2(20))";
		map.inpctime(pct);
		createmap.createpc_time(sql);

		String sql2 = "insert into ENROL_PC(pc_name,pc_b_number,pc_address,m_id)values ('" + mloginbean.getPc_name()
				+ "','" + mloginbean.getPc_b_number() + "','" + mloginbean.getPc_address() + "','"
				+ mloginbean.getM_id() + "')";
		createmap.inspcbinfo(sql2);
		
		String sql3 = "create table " + pcname + "_user_time(u_id varchar2(20), time varchar2(20))";
		
		createmap.usertimecreate(sql3);
		
		
		String enrolupdate = "update pc_maneger set pc_enrol = 'Y' where pc_b_number = '" + mloginbean.getPc_b_number() + "'";
		
		map.enrolupdate(enrolupdate);
		
		mo.addAttribute("side", iser.getpath("???????????????"));
		mo.addAttribute("pc_name", mloginbean.getPc_name());
		mo.addAttribute("pc_b_number", mloginbean.getPc_b_number());
		
		return "pc_enrol/createsuc";
	}
	
}
