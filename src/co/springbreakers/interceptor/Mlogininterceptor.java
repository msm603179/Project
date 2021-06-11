package co.springbreakers.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.Pc_user;


public class Mlogininterceptor implements HandlerInterceptor {

	private Pc_maneger mloginBean;
	private Pc_user uloginBean;

	
	public Mlogininterceptor(Pc_maneger mloginBean,Pc_user uloginBean) {
		// TODO Auto-generated constructor stub
		this.mloginBean = mloginBean;
		this.uloginBean = uloginBean;
	}
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {		

		if(mloginBean.isPc_manegerLogin()==false && uloginBean.isPc_userLogin()==false ) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/maneger/m_not_login");
			return false;
		}
		return true;		
	
	}
	

}