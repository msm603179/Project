package co.springbreakers.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CreatePcMapper {
		
	@Insert("insert into PC_TABLE_FOOD (pc_name,pc_b_number,pc_food_category,pc_food_name,pc_food_price,pc_food_path ) values (#{pc_name},#{pc_b_number},#{pc_food_category},#{pc_food_name},#{pc_food_price},#{pc_food_path })")
	void inpath(@Param("pc_name") String pc_name,@Param("pc_b_number") String pc_b_number,@Param("pc_food_category") String pc_food_category, @Param("pc_food_name") String pc_food_name,
	@Param("pc_food_price") String pc_food_price,@Param("pc_food_path") String pc_food_path);
	
	
	@Select("select pc_food_path from pc_table_food where pc_food_name=#{pc_food_name}")
	String getpath(String pc_food_name);
	
	@Update("${sql}")
	void createenrol1(String sql);
	
	@Update("${sql}")
	void tableFirstInsert(String sql);
		
	//피시방 정보 인서트
	@Insert("${sql}")
	void inspcbinfo(String sql);
	
	//유저 pc방 이름,시간,가격 테이블
	@Update("${sql}")
	void createpc_time(String sql);
	
	//새 유저 정보insert
	@Insert("${sql}")
	void inserttime(String sql);
	
	//새유저,기존유저 판단
	@Select("${sql}")
	String selname(String sql);
	
	//기존유저 정보 업데이트
	@Update("${sql}")
	void uptime(String sql);
	
	//피시방 주소정보
	@Select("${sql}")
	List<String> pcinfo(String sql);
	
	@Update("${sql}")
	public void pcusertime(String sql);
	
	@Select("${sql}")
	public String pcuinfo(String sql);
	
	@Update("${sql}")
	public void usertimecreate(String sql);
}
