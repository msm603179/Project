package co.springbreakers.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.Pc_user;

public class Ulogininterceptor implements HandlerInterceptor {

	private Pc_user uloginBean;
	private Pc_maneger mloginBean;
	
	public Ulogininterceptor(Pc_user uloginBean,Pc_maneger mloginBean) {
		
		this.mloginBean = mloginBean;

		this.uloginBean = uloginBean;
		this.mloginBean = mloginBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(uloginBean.isPc_userLogin()==false && mloginBean.isPc_manegerLogin()==false) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/user/u_not_login");
			return false;
		}
		return true;		
	
	}
	

}
