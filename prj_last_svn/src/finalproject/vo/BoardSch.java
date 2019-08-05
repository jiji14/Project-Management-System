package finalproject.vo;

//검색용vo(model attribute 용)
public class BoardSch {
	//#페이징 처리 속성
	// 1. 전체 건수
	private int count;
	// 2. 1페이지당 출력할 데이터 건수.
	private int pageSize;
	// 3. 총페이지 수
	private int pageCount;
	// 4. 현재 클릭한 페이지 번호..
	private int curPage;
	// 5. 시작번호
	private int start;
	// 6. 마지막 번호
	private int end;
	
	// #BLOCK 처리 속성# 
	// 1. block의 크기
	private int blockSize;
	
	// 2. block의 시작번호.
	private int startBlock;
	
	// 3. block의 마지막번호
	private int endBlock;
	
	
	
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	// #검색할 내용#
	private String title;
	private String writer;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
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
	
	
}
