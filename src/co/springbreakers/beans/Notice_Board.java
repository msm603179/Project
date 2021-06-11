package co.springbreakers.beans;

import javax.validation.constraints.NotBlank;

public class Notice_Board {

	private int notice_num;
	
	@NotBlank(message = "*제목을 입력해주세요")
	private String notice_subject;
	
	@NotBlank(message = "*내용을 입력해주세요")
	private String notice_content;
	private String writedate;
	private int ref;
	private int readcount;
	
	
	
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
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
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	
}
