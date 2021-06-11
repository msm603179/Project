package co.springbreakers.beans;

public class review_board_page {
	
	private int nowpage; //현재 페이지
	private int startpage; //현재 시작 페이지
	private int endpage; //현재 종료 페이지
	private int total; //총 게시물 개수
	private int cntperpage; //페이지 당 글 개수(가변)
	private int lastpage; //전체 마지막 페이지
	
	private int start; //db 시작변수
	private int end; //db끝 변수
	
	private int cntpage=10; //페이지 당 글 개수
	
	public review_board_page() {
	
	}

	
	public review_board_page(int total, int nowpage, int cntperpage) {
		setNowpage(nowpage);
		setCntperpage(cntperpage);
		setTotal(total);
		calclastpage(getTotal(), getCntperpage());
		calcstartpage(getNowpage(), cntpage);
		dbstartend(getNowpage(), getCntperpage());
		
	}
	
	public void calclastpage(int total,int cntperpage) {//전체 마지막 페이지 계산
		setLastpage((int) Math.ceil((double)total / (double)cntperpage));
	}
	
	public void calcstartpage(int nowpage,int cntpage) {//현재 시작,종료 페이지 계산
		setEndpage(( (int)Math.ceil((double)nowpage / (double)cntpage)) * cntpage);
		      //ex 1.0/10.0=0.1 반올림 +정수형변환 = 1*10 =10
		if(getLastpage() < getEndpage()) {//전체 마지막 페이지보다 현재 종료페이지가크면 종료페이지를 마지막 페이지로 변환
			setEndpage(getLastpage());
		}
		setStartpage(getEndpage()-cntpage+1); //현재 시작페이지 현재 종료페이지 - 10 +1 ex) 11 21 31
		if(getStartpage()<1) {
			setStartpage(1); //시작페이지가 0보다 작으면 1로 세팅 
		}

	}
	
	//db에서 쓸 수
	public void dbstartend(int nowpage,int cntperpage) {
		setEnd(nowpage*cntperpage);
		setStart(getEnd()-cntperpage+1);
	}
	
	
	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startage) {
		this.startpage = startage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntperpage() {
		return cntperpage;
	}

	public void setCntperpage(int cntperpage) {
		this.cntperpage = cntperpage;
	}

	public int getLastpage() {
		return lastpage;
	}

	public void setLastpage(int lastpage) {
		this.lastpage = lastpage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntpage() {
		return cntpage;
	}

	public void setCntpage(int cntpage) {
		this.cntpage = cntpage;
	}
	
	
}
