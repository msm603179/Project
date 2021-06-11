package co.springbreakers.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface ImgMapper {
	
	@Insert("insert into imges (iden,img) values (#{name},#{path})")
	void inpath(@Param("name") String name,@Param("path") String path);
	
	@Select("select img from imges where iden=#{name}")
	String getpath(String name);

}
