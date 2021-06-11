package co.springbreakers.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import co.springbreakers.beans.pc_time;

public interface Pc_timeMapper {
	
	@Insert("insert into pc_time_set (pc_name, pc_b_number, pc_time_text, pc_time, pc_time_price) values (#{pc_name}, #{pc_b_number}, #{pc_time_text}, #{pc_time}, #{pc_time_price})")
	void inpctime(pc_time pct);
	
	@Select("select * from pc_time_set where pc_name=#{pc_name}")
	pc_time str(String pc_name);
	
	@Select("select * from pc_time_set where pc_name = #{pc_name}")
	pc_time nameset(String pc_name);
	
	@Update("${sql}")
	void usertimeup(String sql);
	
	@Select("${sql}")
	String usercheck(String sql);
	
	@Insert("${sql}")
	void userinsert(String sql);
	
	@Update("${sql}")
	void enrolupdate(String sql);
	
	@Select("${sql}")
	String idcheck(String sql);
	
	@Update("${sql}")
	void updatetime(String sql);
}
