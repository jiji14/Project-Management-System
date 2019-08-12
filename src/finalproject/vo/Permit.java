package finalproject.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Permit {
	private String taskid;
	private String name;
	private String prjno;
	private String memno;
	private Date uptdate;
	private String dateStart;
	private String dateEnd;
	private String importance;
	private String description;
	private String isread;
	private String approval;
	private String views;
	
	public Permit() {
		super();
		// TODO Auto-generated constructor stub
	}


	


	public Permit(String taskid, String name, String prjno, String memno, Date uptdate, String dateStart,
			String dateEnd, String importance, String description, String isread, String approval, String views) {
		super();
		this.taskid = taskid;
		this.name = name;
		this.prjno = prjno;
		this.memno = memno;
		this.uptdate = uptdate;
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
		this.importance = importance;
		this.description = description;
		this.isread = isread;
		this.approval = approval;
		this.views = views;
	}





	public String getTaskid() {
		return taskid;
	}


	public void setTaskid(String taskid) {
		this.taskid = taskid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPrjno() {
		return prjno;
	}


	public void setPrjno(String prjno) {
		this.prjno = prjno;
	}


	public String getMemno() {
		return memno;
	}


	public void setMemno(String memno) {
		this.memno = memno;
	}


	public Date getUptdate() {
		return uptdate;
	}


	public void setUptdate(Date uptdate) {
		this.uptdate = uptdate;
	}


	public String getImportance() {
		return importance;
	}


	public void setImportance(String importance) {
		this.importance = importance;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}


	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}


	public String getDateStart() {
		return dateStart;
	}


	public void setDateStart(long startdate) {
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String date = (String)formatter.format(new Timestamp(startdate));
		System.out.println(date);
		this.dateStart = date;
	}


	public String getDateEnd() {
		return dateEnd;
	}


	public void setDateEnd(long enddate) {
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String date = (String)formatter.format(new Timestamp(enddate));
		System.out.println(date);
		this.dateEnd = date;
	}


	public String getIsread() {
		return isread;
	}


	public void setIsread(String isread) {
		this.isread = isread;
	}



	public String getApproval() {
		return approval;
	}



	public void setApproval(String approval) {
		this.approval = approval;
	}

	

	
	public String getViews() {
		return views;
	}



	public void setViews(String views) {
		this.views = views;
	}



}
