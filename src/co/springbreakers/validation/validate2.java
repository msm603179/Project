package co.springbreakers.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import co.springbreakers.beans.Pc_maneger;


public class validate2 implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return Pc_maneger.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		
		Pc_maneger maneger=(Pc_maneger) target;
		
		
		
		String pw=maneger.getM_pw();
		String pwchk=maneger.getM_pwchk();
		
		if(!pw.equals(pwchk)) {
			errors.rejectValue("m_pwchk", "pwchk");
		}
		
	}
	
	
	
}
