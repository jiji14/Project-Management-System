package finalproject.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	private String memno;
	private String id;
	private String pw;
	private String name;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date joindate;
	private Date updated;
	private String prjno;
	private String dept;
	private String job;
	
	
	
	//멤버번호 update 생성자
	public Member(String memno, String prjno) {
		super();
		this.memno = memno;
		this.prjno = prjno;
	}

	public Member(String memno, String id, String pw, String name, Date joindate, Date updated, String prjno,
			String dept, String job) {
		super();
		this.memno = memno;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.joindate = joindate;
		this.updated = updated;
		this.prjno = prjno;
		this.dept = dept;
		this.job = job;
	}

	public String getJob() {
		return job;
	}
	
	public void setJob(String job) {
		this.job = job;
	}
	
	
	public String getPrjno() {
		return prjno;
	}
	
	public void setPrjno(String prjno) {
		this.prjno = prjno;
	}
	
	public String getDept() {
		return dept;
	}
	
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public String getMemno() {
		return memno;
	}
	
	public void setMemno(String memno) {
		this.memno = memno;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	
	
}
