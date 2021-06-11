package co.springbreakers.servies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.Zip;
import co.springbreakers.repository.Userreposi;

@Service
public class Userservie {

	@Autowired
	Userreposi urep;

	public void userin(Pc_user user) {
		System.out.println("새 유저 가입");
		urep.userinrep(user);
	}

	public Pc_user userupli(String u_id) {
		System.out.println("회원 정보 수정");
		Pc_user user = urep.useruplirep(u_id);
		return user;

	}

	public void userup(Pc_user user) {
		System.out.println("유저 정보 변경 완료");
		urep.useruprep(user);
	}

	public List<Zip> zipsearch(Zip zip) {
		System.out.println("주소 가져오기");
		List<Zip> z = urep.zipsearchrep(zip);
		return z;
	}

	public List<Zip> areasearch(String area2) {
		List<Zip> z = urep.areasearch(area2);
		return z;
	}

	public String selu_pw(Pc_user user) {
		System.out.println("유저 비밀번호 가져오기");
		String pw = urep.selu_pwrep(user);
		return pw;
	}

	public String findu_id(Pc_user user) {
		System.out.println("유저 아이디 찾기");
		String id = urep.findu_idrep(user);
		return id;
	}

	public String findu_pw(Pc_user user) {
		System.out.println("유저 비밀번호 찾기");
		String pw = urep.findu_pwrep(user);
		return pw;
	}

	public boolean uidchk(String u_id) {

		String u_name = urep.idchkrep(u_id);

		if (u_name == null) {
			return false;
		} else {
			return true;
		}
	}

}
