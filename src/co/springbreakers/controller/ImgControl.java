package co.springbreakers.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.springbreakers.mapper.ImgMapper;
import co.springbreakers.servies.ImgServie;

@Controller
@RequestMapping("imgup")
public class ImgControl {
	
	@Autowired
	ImgMapper map;
	
	@Autowired
	ImgServie ser;
	
	@RequestMapping(value = "imgpage")
		public String imgup() {
			return "imgup/imgpage";
	}
	
	@RequestMapping("/img")
	   public ModelAndView foodimgenrol(
	         HttpServletRequest request) throws IOException {



	      ModelAndView mav = new ModelAndView();

	      // request 요청값(이미지업로드) MultipartHttpServletRequest로 변환.
	      // 서블릿에 MultipartResolver 객체 있어야함.
	      MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

	      // request 영역에 저장된 file 이름의 업로드파일 요청값 저장
	      MultipartFile file = multi.getFile("file");

	      // 파일 저장경로 설정할 변수
	      String path = "";
	      

	      

	      // 랜덤한 교유번호 지정.
	      UUID randomeUUID = UUID.randomUUID();

	      if (file != null) {

	         System.out.println("파라미터명" + file.getName());
	         System.out.println("파일크기" + file.getSize());
	         System.out.println("파일 존재" + file.isEmpty());
	         System.out.println("오리지날 파일 이름" + file.getOriginalFilename());
	    
	         path = "C:/Users/82109/eclipse-workspace2/Spring_project/WebContent/WEB-INF/img/";
	                
	         InputStream inputStream = null;
	         OutputStream outputStream = null;

	         // 고유번호 + 원본 파일 이름
	         String organizedfilePath = "";

	         try {

	            if (file.getSize() > 0) {
	               inputStream = file.getInputStream();

	               // path로 지정한 경로에 폴더가 없으면 폴더생성
	               File realUploadDir = new File(path);

	               if (!realUploadDir.exists()) {
	                  realUploadDir.mkdirs();// 폴더생성.
	               }

	               // 저장경로 + 고유번호 + 원본 파일 이름
	               organizedfilePath = path + randomeUUID + "_" + file.getOriginalFilename();
	               System.out.println(organizedfilePath);
	     	      //식별자
	     	      String name=request.getParameter("name");
	     	     String pathname=randomeUUID + "_" + file.getOriginalFilename();
	               // 저장경로 + 고유번호 + 원본 파일명 FileoutputStream으로 저장함.
	               outputStream = new FileOutputStream(organizedfilePath);
	               
	               int readByte = 0;
	               byte[] buffer = new byte[8192];
	               
	               ser.inpath(name,pathname);

	               while ((readByte = inputStream.read(buffer, 0, 8120)) != -1) {
	                  outputStream.write(buffer, 0, readByte); // 파일 생성 !

	               }

	            }

	         } catch (Exception e) {
	            e.printStackTrace();

	         } finally {

	            outputStream.close();
	            inputStream.close();
	         }

	      }
	      
	      mav.setViewName("imgup/imgpage");

	      return mav;
	   }

}
