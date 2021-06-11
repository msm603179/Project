package co.springbreakers.config;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.Pc_user;


@Configuration

@EnableWebMvc

@ComponentScan("co.springbreakers.controller")
@ComponentScan("co.springbreakers.mapper")
@ComponentScan("co.springbreakers.servies")
@ComponentScan("co.springbreakers.repository")
@ComponentScan("co.springbreakers.validation")
@ComponentScan("co.springbreakers.config")
@ComponentScan("co.springbreakers.interceptor")

public class ServletApp implements WebMvcConfigurer {
	
	@Bean("uloginBean")
	@SessionScope
	public Pc_user uloginBean() {
		return new Pc_user();
	}
	
	@Bean("mloginBean")
	@SessionScope
	public Pc_maneger mloginBean() {
		return new Pc_maneger();
	}

	
	public void configureViewResolvers(ViewResolverRegistry registry) {

		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}

	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		
		ReloadableResourceBundleMessageSource re = new ReloadableResourceBundleMessageSource();

		re.setBasenames("/WEB-INF/properties/check");

		return re;

	}
	

	
}
