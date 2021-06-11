package co.springbreakers.beans;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Pc_maneger {
	
	private String m_join_date;

	@NotBlank(message = "*피시방 이름 필수 작성")
	private String pc_name;
	
	@NotBlank(message = "*가맹점 번호 필수 작성")
	private String pc_b_number;
	
	@NotBlank(message = "*이름 필수 작성")
	private String m_name;
	
	@NotBlank(message = "*아이디 필수 작성")
	@Pattern(regexp = "^[a-zA-Z0-9]{6,15}", message = "*아이디는 6~15글자 영어, 숫자 조합")
	private String m_id;
	
	@NotBlank(message = "*비밀번호 필수 작성")
	@Pattern(regexp = "^[a-zA-Z0-9/[~!@#$%^&*()_+|<>?:{}]/]{8,15}", message = "*비밀번호는 8~15글자 영어, 숫자, 특수문자 조합")
	private String m_pw;
	
	private String m_pwchk;
	
	private boolean pc_manegerLogin;
	private boolean midchk;



	@Email(message = "*이메일 형식 이여야 합니다.")
	private String m_email;
	
	@NotBlank(message = "*핸드폰 번호는 비워둘 수 없습니다")
	@Pattern(regexp = "^[0-9]*", message = "*핸드폰 번호 '-' 없이 입력")
	private String m_phone;
	
	@NotBlank(message = "*생년월일은 비워둘 수 없습니다.")
	@Size(min = 6,max = 6)
	private String m_birthday;
	
	private String pc_address;
	
	private String pc_enrol="N";
	
	public boolean isPc_manegerLogin() {
		return pc_manegerLogin;
	}

	public void setPc_manegerLogin(boolean pc_manegerLogin) {
		this.pc_manegerLogin = pc_manegerLogin;
	}
	
	public String getM_pwchk() {
		return m_pwchk;
	}

	public void setM_pwchk(String m_pwchk) {
		this.m_pwchk = m_pwchk;
	}

	
	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_birthday() {
		return m_birthday;
	}

	public void setM_birthday(String m_birthday) {
		this.m_birthday = m_birthday;
	}

	public String getPc_address() {
		return pc_address;
	}

	public void setPc_address(String pc_address) {
		this.pc_address = pc_address;
	}

	public String getPc_enrol() {
		return pc_enrol;
	}

	public void setPc_enrol(String pc_enrol) {
		this.pc_enrol = pc_enrol;
	}

	public String getPc_name() {
		return pc_name;
	}

	public void setPc_name(String pc_name) {
		this.pc_name = pc_name;
	}

	public String getPc_b_number() {
		return pc_b_number;
	}

	public void setPc_b_number(String pc_b_number) {
		this.pc_b_number = pc_b_number;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	
	public String getM_join_date() {
		return m_join_date;
	}

	public void setM_join_date(String m_join_date) {
		this.m_join_date = m_join_date;
	}
	
	public boolean isMidchk() {
		return midchk;
	}

	public void setMidchk(boolean midchk) {
		this.midchk = midchk;
	}
	
	
	
}

