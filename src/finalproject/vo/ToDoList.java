package finalproject.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ToDoList {
	private String prjno;
	private String taskid;
	private String name;
	private int progress;
	private String description;
	private String status;
	private long startdate;
	private long enddate;
	private String dateStart;
	private String dateEnd;
	private int duration;
	private String approval;
	private int isHidden;
	private String memno;
	private String isread; // 0 :안읽음  1: 읽음
	private int checkalarm; // 0: 알람띄우기 1: 알람지우기
	

	public ToDoList() {
		super();
	}


	public String getPrjno() {
		return prjno;
	}


	public void setPrjno(String prjno) {
		this.prjno = prjno;
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


	public int getProgress() {
		return progress;
	}


	public void setProgress(int progress) {
		this.progress = progress;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public long getStartdate() {
		return startdate;
	}


	public void setStartdate(long startdate) {
		this.startdate = startdate;
		setDateStart(startdate);
	}


	public long getEnddate() {
		return enddate;
	}


	public void setEnddate(long enddate) {
		this.enddate = enddate;
		setDateEnd(enddate);
	}


	public int getDuration() {
		return duration;
	}


	public void setDuration(int duration) {
		this.duration = duration;
	}


	public String getApproval() {
		return approval;
	}


	public void setApproval(String approval) {
		this.approval = approval;
	}


	public int getIsHidden() {
		return isHidden;
	}


	public void setIsHidden(int isHidden) {
		this.isHidden = isHidden;
	}


	public String getMemno() {
		return memno;
	}


	public void setMemno(String memno) {
		this.memno = memno;
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


	public int getCheckalarm() {
		return checkalarm;
	}


	public void setCheckalarm(int checkalarm) {
		this.checkalarm = checkalarm;
	}

}
				