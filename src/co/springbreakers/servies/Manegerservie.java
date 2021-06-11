package co.springbreakers.servies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.Zip;
import co.springbreakers.repository.Manegerreposi;

@Service
public class Manegerservie {
	
	@Autowired
	Manegerreposi mrep;
	
	public void manegerin(Pc_maneger man){
		System.out.println("새 점주 가입");
		mrep.manegerinrep(man);
	}
	
	public Pc_maneger manupli(String m_id){
		System.out.println("회원 정보 수정");
		Pc_maneger man=mrep.manuplirep(m_id);
		return man;

	}
	
	public void manup(Pc_maneger man){
		System.out.println("유저 정보 변경 완료");
		mrep.manuprep(man);
	}
	
	public List<Zip> zipsearch(Zip zip){
		System.out.println("주소 가져오기");
		List<Zip> z=mrep.zipsearchrep(zip);
		return z;
	}
	
	public String selm_pw(Pc_maneger man) {
		System.out.println("점주 비밀번호 가져오기");
		String pw=mrep.selm_pwrep(man);
		return pw;
	}
	
	public String findm_id(Pc_maneger man) {
		System.out.println("점주 아이디 찾기");
		String id=mrep.findm_idrep(man);
		return id;
	}
	
	public String findm_pw(Pc_maneger man) {
		System.out.println("점주 비밀번호 찾기");
		String pw=mrep.findm_pwrep(man);
		return pw;
	}
	
	public boolean midchk(String m_id) {

		String m_name = mrep.idchkrep(m_id);

		if (m_name == null) {
			return false;
		} else {
			return true;
		}
	}

}
