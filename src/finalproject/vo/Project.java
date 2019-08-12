package finalproject.vo;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Project {

	private String prjno;
	private String prjname;
	private String prjstatus;
	private String client;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date stdate;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date duedate;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date uptdate;
	private String description;
	private String activation;
	private String memno;
	private String prjadmin;
	
	public Project() {
		super();
	}

	public String getPrjno() {
		return prjno;
	}

	public void setPrjno(String prjno) {
		this.prjno = prjno;
	}

	public String getPrjname() {
		return prjname;
	}

	public void setPrjname(String prjname) {
		this.prjname = prjname;
	}

	public String getPrjstatus() {
		return prjstatus;
	}

	public void setPrjstatus(String prjstatus) {
		this.prjstatus = prjstatus;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public Date getStdate() {
		return stdate;
	}

	public void setStdate(Date stdate) {
		this.stdate = stdate;
	}

	public Date getDuedate() {
		return duedate;
	}

	public void setDuedate(Date duedate) {
		this.duedate = duedate;
	}

	public Date getUptdate() {
		return uptdate;
	}

	public void setUptdate(Date uptdate) {
		this.uptdate = uptdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getActivation() {
		return activation;
	}

	public void setActivation(String activation) {
		this.activation = activation;
	}

	public String getMemno() {
		return memno;
	}

	public void setMemno(String memno) {
		this.memno = memno;
	}

	public String getPrjadmin() {
		return prjadmin;
	}

	public void setPrjadmin(String prjadmin) {
		this.prjadmin = prjadmin;
	}

	
	
	
}


