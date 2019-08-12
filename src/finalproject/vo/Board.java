package finalproject.vo;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

//조회용 list용 vo
public class Board {
	private int no;
	private int refno;
	private String title;
	private String content;
	private String writer;
	private int readcnt;
	private Date credte;
	private Date uptdte;
	private String etc;
	private int level;
	private String category;
	private String prjno;
	
	public String getPrjno() {
		return prjno;
	}



	public void setPrjno(String prjno) {
		this.prjno = prjno;
	}



	//파일 정보 list 가져오기 
	//dao는 다르지만, 한번에 기본정보와 파일을 가져올 수게 처리하기 위해서. fnames는 나중에 c03_boardDetail.jsp에서 ${board.fnames}
	private ArrayList<String> fnames;
	
	// 파일 등록 처리 정보.. file controller에서 나타남.
	private MultipartFile[] report;
	
	//위에 두개를 database에서 한꺼번에 가져올수는 있겠지만 쓸데없는 데이터를 불러오게 될수도 있다.
	// select * from board; , select * from boardfile;  두개를 조인할수는 있겠지만 비효율적.
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public Board(int no, int refno, String title, String content, String writer, int readcnt, Date credte, Date uptdte,
			String etc, String category, String prjno) {
		super();
		this.no = no;
		this.refno = refno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.readcnt = readcnt;
		this.credte = credte;
		this.uptdte = uptdte;
		this.etc = etc;
		this.category = category;
		this.prjno = prjno;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRefno() {
		return refno;
	}

	public void setRefno(int refno) {
		this.refno = refno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public Date getCredte() {
		return credte;
	}

	public void setCredte(Date credte) {
		this.credte = credte;
	}

	public Date getUptdte() {
		return uptdte;
	}

	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}



	public MultipartFile[] getReport() {
		return report;
	}
	
	
	// 파일 전송해서 받을수 있게 name="report" setReport 이름이 report여야지 이쪽으로 넘오온다
	// type="file" 인 것을 여러개 받기 위해 MultipartFile[] report 배열을 만들어주는거다. 
	// Controller로 넘어가서 111참고
	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
		


	public ArrayList<String> getFnames() {
		return fnames;
	}



	public void setFnames(ArrayList<String> fnames) {
		this.fnames = fnames;
	}

	public int getLevel() {
		return level;
	}



	public void setLevel(int level) {
		this.level = level;
	}
	
	

	/*
	 * public void setFnames(String[] fnames) { // TODO Auto-generated method stub
	 * this.fnames = fnames; }
	 */
	
	
}
