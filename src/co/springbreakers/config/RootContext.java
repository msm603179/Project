package co.springbreakers.config;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.Pc_user;
import co.springbreakers.interceptor.Mlogininterceptor;
import co.springbreakers.interceptor.Ulogininterceptor;
import co.springbreakers.mapper.BoardMapper;
import co.springbreakers.mapper.CreatePcMapper;
import co.springbreakers.mapper.ImgMapper;
import co.springbreakers.mapper.Manegermapper;
import co.springbreakers.mapper.PcMapper;
import co.springbreakers.mapper.PcUserTimeMapper;
import co.springbreakers.mapper.Pc_timeMapper;
import co.springbreakers.mapper.RevBoardMapper;
import co.springbreakers.mapper.Usermapper;

@Configuration

@ComponentScan("co.springbreakers.controller")
@ComponentScan("co.springbreakers.mapper")
@ComponentScan("co.springbreakers.servies")
@ComponentScan("co.springbreakers.repository")
@ComponentScan("co.springbreakers.validation")
@ComponentScan("co.springbreakers.config")
@ComponentScan("co.springbreakers.interceptor")
@ComponentScan("co.springbreakers.scheduler")


@PropertySource("/WEB-INF/properties/oracledb.properties")
public class RootContext implements WebMvcConfigurer {

	@Value("${oracledb.classname}")
	private String oracledb_classname;

	@Value("${oracledb.url}")
	private String oracledb_url;

	@Value("${oracledb.username}")
	private String oracledb_username;

	@Value("${oracledb.password}")
	private String oracledb_password;

	@Resource(name = "uloginBean")
	private Pc_user uloginBean;

	@Resource(name = "mloginBean")
	private Pc_maneger mloginBean;
	


	@Bean
	public BasicDataSource dataSource() {

		BasicDataSource source = new BasicDataSource();

		source.setDriverClassName(oracledb_classname);
		source.setUrl(oracledb_url);
		source.setUsername(oracledb_username);
		source.setPassword(oracledb_password);

		return source;
	}



	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {

		SqlSessionFactoryBean fac = new SqlSessionFactoryBean();
 
		fac.setDataSource(source);

		SqlSessionFactory factory = fac.getObject();

		return factory;
	}


	@Bean
	public MapperFactoryBean<BoardMapper> ma1(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<BoardMapper> fac = new MapperFactoryBean<BoardMapper>(BoardMapper.class);

		fac.setSqlSessionFactory(factory);

		return fac;
	}

	@Bean
	public MapperFactoryBean<Usermapper> ma2(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<Usermapper> fac = new MapperFactoryBean<Usermapper>(Usermapper.class);

		fac.setSqlSessionFactory(factory);

		return fac;
	}

	@Bean
	public MapperFactoryBean<Manegermapper> ma3(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<Manegermapper> fac = new MapperFactoryBean<Manegermapper>(Manegermapper.class);

		fac.setSqlSessionFactory(factory);

		return fac;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// Auto-generated method stub WebMvcConfigurer.super.addInterceptors(registry);

		Ulogininterceptor ulogininterceptor = new Ulogininterceptor(uloginBean, mloginBean);
		InterceptorRegistration regu = registry.addInterceptor(ulogininterceptor);
		regu.addPathPatterns("/user/upuser", "/logout", "/board/*");
		// regu.excludePathPatterns("/board/main"); 예외 게시판 메인

		Mlogininterceptor mlogininterceptor = new Mlogininterceptor(mloginBean, uloginBean);
		InterceptorRegistration regm = registry.addInterceptor(mlogininterceptor);// 인터셉터 등록
		regm.addPathPatterns("/maneger/upmaneger", "/logout", "/board/*");

	}

	@Bean
	public MapperFactoryBean<CreatePcMapper> ma4(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<CreatePcMapper> fac = new MapperFactoryBean<CreatePcMapper>(CreatePcMapper.class);

		fac.setSqlSessionFactory(factory);

		return fac;
	}

	@Bean
	public MapperFactoryBean<Pc_timeMapper> ma5(SqlSessionFactory fac) throws Exception {
		MapperFactoryBean<Pc_timeMapper> map = new MapperFactoryBean<Pc_timeMapper>(Pc_timeMapper.class);
		map.setSqlSessionFactory(fac);

		return map;
	}

	@Bean
	public MapperFactoryBean<RevBoardMapper> ma6(SqlSessionFactory fac) throws Exception {
		MapperFactoryBean<RevBoardMapper> map = new MapperFactoryBean<RevBoardMapper>(RevBoardMapper.class);
		map.setSqlSessionFactory(fac);

		return map;
	}
	
	@Bean
	public MapperFactoryBean<ImgMapper> ma7(SqlSessionFactory fac) throws Exception {
		MapperFactoryBean<ImgMapper> map = new MapperFactoryBean<ImgMapper>(ImgMapper.class);
		map.setSqlSessionFactory(fac);
		
		return map;
	}
	
	@Bean
	public MapperFactoryBean<PcMapper> ma8(SqlSessionFactory fac) throws Exception {
		MapperFactoryBean<PcMapper> map = new MapperFactoryBean<PcMapper>(PcMapper.class);
		map.setSqlSessionFactory(fac);
		
		return map;
	}
	
	@Bean
	public MapperFactoryBean<PcUserTimeMapper> ma9(SqlSessionFactory fac) throws Exception {
		MapperFactoryBean<PcUserTimeMapper> map = new MapperFactoryBean<PcUserTimeMapper>(PcUserTimeMapper.class);
		map.setSqlSessionFactory(fac);
		
		return map;
	}
	

	// 이미지 최대 사이즈 지정. 10MB. (디폴트 값도 10MB임)
	private final int FILE_MAX_UPLOAD_SIZE = 1024 * 1024 * 10;

	
	// 이미지 업로드 위해서 MultipartResolver 객체 생성
	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(FILE_MAX_UPLOAD_SIZE);
		return multipartResolver;
	}
	
	
	
	
	
	

	
}
