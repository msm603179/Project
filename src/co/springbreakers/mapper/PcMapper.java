package co.springbreakers.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface PcMapper {

	@Select("${sql}")
	public String pc_result(String sql);

	@Select("${sql}")
	public List<String> colums_name(String sql);

	// 피시방 음식사진 뺴오기
	@Select("${sql}")
	List<String> getfoodpath(String sql);

	@Select("${sql}")
	public int colums_count(String sql);
	
	@Select("${sql}")
	public String data(String sql);
}
