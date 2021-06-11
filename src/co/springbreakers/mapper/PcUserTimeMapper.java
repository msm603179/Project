package co.springbreakers.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface PcUserTimeMapper {

	@Select("${sql}")
	public String useTimeCheck(String sql);
	
	@Update("${sql}")
	public void change(String sql);
	
	@Select("${sql}")
	public String usecheck(String sql);
	
	@Update("${sql}")
	public void useend(String sql);
	
	@Update("${sql}")
	public void timeset(String sql);
}
