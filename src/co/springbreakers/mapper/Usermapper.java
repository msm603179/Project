package co.springbreakers.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.Zip;

//유저관련 sql
public interface Usermapper {
	
	//회원가입
	@Insert("insert into pc_user (u_join_date,u_name,u_id,u_pw,u_birthday,u_phone,u_addr,u_email) values(sysdate,#{u_name},#{u_id},#{u_pw},#{u_birthday},#{u_phone},#{u_addr},#{u_email})")
	void in_user(Pc_user user);
	
	//회원정보 받아옴
	@Select("select * from pc_user where u_id=#{u_id}")
	Pc_user upuserli(String u_id);
	
	//우편번호 기반 주소 받아옴
	@Select("select * from addr_search where zipcode=#{zipcode}")
	List<Zip> zipsearch(Zip zip);
	
	@Select("select * from addr_search where area2 = #{area2}")
	List<Zip> areasearch(String area2);
	
	//회원정보 수정 로그인 추가기능으로 변경 where=pw
	@Update("update pc_user set u_name=#{u_name},u_pw=#{u_pw},u_birthday=#{u_birthday},u_phone=#{u_phone},u_addr=#{u_addr},u_email=#{u_email} where u_id=#{u_id}")
	void up_user(Pc_user user);
	
	//로그인 정보
	@Select("select u_pw from pc_user where u_id=#{u_id}")
	String selu_pw(Pc_user user);
	
	//아이디 찾기
	@Select("select u_id from pc_user where u_name=#{u_name} and u_birthday=#{u_birthday}")
	String findu_id(Pc_user user);
	
	//비밀번호 찾기
	@Select("select u_pw from pc_user where u_name=#{u_name} and u_id=#{u_id} and u_birthday=#{u_birthday}")
	String findu_pw(Pc_user user);
	
	//아이디 체크
	@Select("select u_name from pc_user where u_id = #{u_id}")
	String uidcheck(String u_id);
	
	
	
}
