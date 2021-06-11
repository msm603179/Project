package co.springbreakers.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import co.springbreakers.beans.Pc_Sales;
import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.SalesData;
import co.springbreakers.beans.Zip;

public interface Manegermapper {
	//회원가입
	@Insert("insert into pc_maneger (m_join_date,pc_name,pc_b_number,m_name,m_id,m_pw,m_birthday,m_phone,pc_address,m_email,pc_enrol) values(sysdate,#{pc_name},#{pc_b_number},#{m_name},#{m_id},#{m_pw},#{m_birthday},#{m_phone},#{pc_address},#{m_email},#{pc_enrol})")
	void in_maneger(Pc_maneger man);
	
	//주소찾기
	@Select("select * from addr_search where zipcode=#{zipcode}")
	List<Zip> zipsearch(Zip zip);
	
	//점주정보 받아옴
	@Select("select * from pc_maneger where m_id=#{m_id}")
	Pc_maneger upmanli(String m_id);
	
	//점주정보 수정
	@Update("update pc_maneger set pc_name=#{pc_name}, pc_b_number=#{pc_b_number}, m_name=#{m_name},m_pw=#{m_pw},m_birthday=#{m_birthday},m_phone=#{m_phone},pc_address=#{pc_address},m_email=#{m_email} where m_id=#{m_id}")
	void up_maneger(Pc_maneger man);
	
	//로그인 정보
	@Select("select m_pw from pc_maneger where m_id=#{m_id}")
	String selm_pw(Pc_maneger man);
	
	//아이디 찾기
	@Select("select m_id from pc_maneger where m_name=#{m_name} and m_birthday=#{m_birthday}")
	String findm_id(Pc_maneger man);
	
	//비밀번호 찾기
	@Select("select m_pw from pc_maneger where m_name=#{m_name} and m_id=#{m_id} and m_birthday=#{m_birthday}")
	String findm_pw(Pc_maneger man);
	
	//아이디 체크
	@Select("select m_name from pc_maneger where m_id = #{m_id}")
	String midcheck(String m_id);

	//피시방 등록시 pc_enrol "Y" 로 변경
	@Update("${sql}")
	public void enrolChange(String sql);
	
	@Select("${sql}")
	public List<Pc_Sales> saleslist(String sql);
	
	@Select("${sql}")
	public String totalSales(String sql);
	
	@Select("${sql}")
	public List<SalesData> salesData(String sql);
	
}
