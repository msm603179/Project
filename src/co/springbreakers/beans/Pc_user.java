package co.springbreakers.beans;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Pc_user {
	
private String u_join_date;

@NotBlank(message = "*이름은 비워둘 수 없습니다.")
private String u_name;

@NotBlank(message = "*아이디는 비워둘 수 없습니다.")
@Pattern(regexp = "^[a-zA-Z0-9]{6,15}", message = "*아이디는 6~15글자 영어, 숫자 조합")
private String u_id;

@NotBlank(message = "*비밀번호는 비워둘 수 없습니다.")
@Pattern(regexp = "^[a-zA-Z0-9/[~!@#$%^&*()_+|<>?:{}]/]{8,15}", message = "*비밀번호는 8~15글자 영어, 숫자, 특수문자 조합") 
private String u_pw;

@NotBlank(message = "*생년월일은 비워둘 수 없습니다.")
@Size(min = 6,max = 6)
private String u_birthday;

@NotBlank(message = "*핸드폰 번호는 비워둘 수 없습니다")
@Pattern(regexp = "^[0-9]*", message = "*핸드폰 번호 '-' 없이 입력")
private String u_phone;

private String u_addr;

@Email(message = "*이메일 형식 이여야 합니다.")
private String u_email;

private String u_pwchk;

private boolean pc_userLogin;
private boolean uidchk;



public boolean isPc_userLogin() {
	return pc_userLogin;
}


public void setPc_userLogin(boolean pc_userLogin) {
	this.pc_userLogin = pc_userLogin;
}

	public String getU_pwchk() {
	return u_pwchk;
}

public void setU_pwchk(String u_pwchk) {
	this.u_pwchk = u_pwchk;
}

	public String getU_join_date() {
		return u_join_date;
	}

	public void setU_join_date(String u_join_date) {
		this.u_join_date = u_join_date;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_birthday() {
		return u_birthday;
	}

	public void setU_birthday(String u_birthday) {
		this.u_birthday = u_birthday;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_addr() {
		return u_addr;
	}

	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	
	public boolean isUidchk() {
		return uidchk;
	}


	public void setUidchk(boolean uidchk) {
		this.uidchk = uidchk;
	}
	

	
}
