package finalproject.vo;

public class Profile {
	private int memno;
	private String name;
	private String dept;
	private String job;
	private String pw;
	
	
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getMemno() {
		return memno;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public Profile(String name, String dept, String job) {
		super();
		this.name = name;
		this.dept = dept;
		this.job = job;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Profile() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
