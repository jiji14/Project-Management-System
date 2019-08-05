package finalproject.vo;
//finalproject.vo.Members

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class Members {
	private String membern;
	private String memno;
	private String prjno;
	private String auth;
	private String activation;
	@DateTimeFormat(pattern = "yyyy/MM//dd")
	private Date uptdate;
	//멤버 테이블에 있는 컬럼들
	
	private String name;
	private String id;
	private String dept;
	private String job;
	//view 단에 있는 컬럼들
	
	public Members() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Members(String memno, String prjno, String auth) {
		super();
		this.memno = memno;
		this.prjno = prjno;
		this.auth = auth;
	}

	public String getMembern() {
		return membern;
	}


	public void setMembern(String membern) {
		this.membern = membern;
	}


	public String getMemno() {
		return memno;
	}

	public void setMemno(String memno) {
		this.memno = memno;
	}

	public String getPrjno() {
		return prjno;
	}

	public void setPrjno(String prjno) {
		this.prjno = prjno;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getActivation() {
		return activation;
	}

	public void setActivation(String activation) {
		this.activation = activation;
	}

	public Date getUptdate() {
		return uptdate;
	}

	public void setUptdate(Date uptdate) {
		this.uptdate = uptdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
	
	
	
	
}
