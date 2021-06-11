package co.springbreakers.beans;

import javax.validation.constraints.NotBlank;

public class review_board {
	
	private String rdate;
	
	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	private int num;

	

	private String content;
	
	private String id;
	
	private int ref;
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}


}
