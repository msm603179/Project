package co.springbreakers.beans;

public class Pc_Main1 {

	private String tableid;
	private String u_id;
	private String usertime;
	
	public Pc_Main1(String tableid, String u_id, String usertime) {
		
		this.tableid = tableid;
		this.u_id = u_id;
		this.usertime = usertime;
		
	}
	
	public String getTableid() {
		return tableid;
	}
	public void setTableid(String tableid) {
		this.tableid = tableid;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getUsertime() {
		return usertime;
	}
	public void setUsertime(String usertime) {
		this.usertime = usertime;
	}
	
	
	
}
