package co.springbreakers.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.Zip;
import co.springbreakers.mapper.Usermapper;

@Repository
public class Userreposi {

	@Autowired
	Usermapper umap;

	public void userinrep(Pc_user user) {
		umap.in_user(user);
	}

	public Pc_user useruplirep(String u_id) {
		Pc_user user = umap.upuserli(u_id);
		return user;

	}

	public void useruprep(Pc_user user) {
		umap.up_user(user);
	}

	public List<Zip> zipsearchrep(Zip zip) {
		List<Zip> z = umap.zipsearch(zip);
		return z;
	}

	public List<Zip> areasearch(String area2) {
		List<Zip> z = umap.areasearch(area2);
		return z;
	}

	public String selu_pwrep(Pc_user user) {
		String pw = umap.selu_pw(user);
		return pw;
	}

	public String findu_idrep(Pc_user user) {
		String id = umap.findu_id(user);
		return id;
	}

	public String findu_pwrep(Pc_user user) {
		String pw = umap.findu_pw(user);
		return pw;
	}

	public String idchkrep(String u_id) {
		String u_name = umap.uidcheck(u_id);
		return u_name;

	}

}
