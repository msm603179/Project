package co.springbreakers.beans;

import javax.validation.constraints.NotBlank;

public class QA_Board {

	private int num;
	
	@NotBlank(message = "*제목을 입력해주세요")
	private String subject;

	@NotBlank(message = "*내용을 입력해주세요")
	private String content;
	
	private String u_id;
	
	private String writedate;
	
	private int ref;
	private int step;
	private int bolevel;
	private int readcount;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getBolevel() {
		return bolevel;
	}
	public void setBolevel(int bolevel) {
		this.bolevel = bolevel;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
}

