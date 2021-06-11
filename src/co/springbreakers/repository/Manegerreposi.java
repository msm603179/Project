package co.springbreakers.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.springbreakers.beans.Pc_maneger;
import co.springbreakers.beans.Pc_user;
import co.springbreakers.beans.Zip;
import co.springbreakers.mapper.Manegermapper;
import co.springbreakers.mapper.Usermapper;

@Repository
public class Manegerreposi {
	
	@Autowired
	Manegermapper mmap;
	
	public void manegerinrep(Pc_maneger man) {
		mmap.in_maneger(man);
	}
	
	public Pc_maneger manuplirep(String m_id) {
		Pc_maneger man=mmap.upmanli(m_id);
		return man;

	}
	
	public void manuprep(Pc_maneger man) {
		mmap.up_maneger(man);
	}
	
	public List<Zip> zipsearchrep(Zip zip){
		List<Zip> z=mmap.zipsearch(zip);
		return z;
	}
	
	public String selm_pwrep(Pc_maneger man) {
		String pw=mmap.selm_pw(man);
		return pw;
	}
	
	public String findm_idrep(Pc_maneger man) {
		String id=mmap.findm_id(man);
		return id;
	}
	
	public String findm_pwrep(Pc_maneger man) {
		String pw=mmap.findm_pw(man);
		return pw;
	}
	
	public String idchkrep(String m_id) {
		String m_name = mmap.midcheck(m_id);
		return m_name;

	}
	
}
