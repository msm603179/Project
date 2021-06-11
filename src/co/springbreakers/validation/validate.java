package co.springbreakers.validation;

import org.hibernate.validator.internal.metadata.facets.Validatable;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.Zip;


public class validate implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return Pc_user.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		
		Pc_user user=(Pc_user) target;
		
		
		
		String pw=user.getU_pw();
		String pwchk=user.getU_pwchk();
		
		if(!pw.equals(pwchk)) {
			errors.rejectValue("u_pwchk", "pwchk");
		}
		
	}
	
	
	
}
