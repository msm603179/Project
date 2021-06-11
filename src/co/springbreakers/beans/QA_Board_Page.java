package co.springbreakers.beans;

public class QA_Board_Page {

	// 페이지 번호 시작값
	private int min;

	// 페이지 번호 마지막값
	private int max;

	// 페이지 번호 생성할 갯수
	private int numberring;

	// 10개씩 조회 (선택한 값대로 조회.. 는 일단 보류)
	private int pagesize;

	// 클릭한 페이지 번호 ??..
	private int pagenum;

	// 게시글 총 갯수..
	private int contentcount;

	// db조회시 시작할 행 번호
	private int startrow;

	// db조회시 마지막으로 조회할 행 번호
	private int endrow;

/////////////   
	private int prevPage;
	private int nextPage;

/////////////   

	// 값 계산할 수식 생성자에서 작성.
	public QA_Board_Page(int contentcount, int pagenum, int pagesize) {

		this.pagesize = pagesize;
		this.contentcount = contentcount;
		this.pagenum = pagenum;

		numberring = contentcount / pagesize + (contentcount % pagesize == 0 ? 0 : 1);

		if (numberring % 10 != 0) {
			min = (numberring / pagesize) * pagesize + 1;
		} else {
			min = ((numberring / pagesize) - 1) * pagesize + 1;
		}
		
		if (min < 0) {
			min = 1;
		}

		if (numberring <= 10) {
			max = numberring;
		} else {
			max = min + pagesize - 1;
		}

		startrow = (pagenum - 1) * pagesize + 1;

		endrow = startrow + pagesize - 1;
		
		prevPage = pagenum - 1;
		nextPage = pagenum + 1;
		
		if (nextPage > numberring) {
			nextPage = numberring;
		}

	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getNumberring() {
		return numberring;
	}

	public void setNumberring(int numberring) {
		this.numberring = numberring;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getPagenum() {
		return pagenum;
	}

	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}

	public int getContentcount() {
		return contentcount;
	}

	public void setContentcount(int contentcount) {
		this.contentcount = contentcount;
	}

	public int getStartrow() {
		return startrow;
	}

	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}

	public int getEndrow() {
		return endrow;
	}

	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

}
