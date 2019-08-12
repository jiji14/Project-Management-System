package finalproject.vo;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TaskAll {
   //Task Table 
   private String id; 
   private String prjno;
   private String name;
   private int progress;
   private String description;
   private String code;
   private String status;
   private String depends;
   private long start;
   private int duration;
   private long end;
   private boolean startIsMilestone;
   private boolean endIsMilestone;
   private String importance;
   private String uptdate;
   private String approval;
   private String isread;
   private int checkalarm;
   private int ishidden;
   private String level;
   private String views;
   
   public TaskAll() {
	super();
   }

	public TaskAll(String id, String prjno, String name, int progress, String description, String code, String status,
		String depends, long start, int duration, long end, boolean startIsMilestone, boolean endIsMilestone,
		String importance, String uptdate, String approval) {
	super();
	this.id = id;
	this.prjno = prjno;
	this.name = name;
	this.progress = progress;
	this.description = description;
	this.code = code;
	this.status = status;
	this.depends = depends;
	this.start = start;
	this.duration = duration;
	this.end = end;
	this.startIsMilestone = startIsMilestone;
	this.endIsMilestone = endIsMilestone;
	this.importance = importance;
	this.uptdate = uptdate;
	this.approval = approval;
	}
	
	

	

	public TaskAll(String id, String prjno, String name, int progress, String description, String code, String status,
			String depends, long start, int duration, long end, boolean startIsMilestone, boolean endIsMilestone,
			String importance, String uptdate, String approval, String isread, int checkalarm, int ishidden,
			String level, String views) {
		super();
		this.id = id;
		this.prjno = prjno;
		this.name = name;
		this.progress = progress;
		this.description = description;
		this.code = code;
		this.status = status;
		this.depends = depends;
		this.start = start;
		this.duration = duration;
		this.end = end;
		this.startIsMilestone = startIsMilestone;
		this.endIsMilestone = endIsMilestone;
		this.importance = importance;
		this.uptdate = uptdate;
		this.approval = approval;
		this.isread = isread;
		this.checkalarm = checkalarm;
		this.ishidden = ishidden;
		this.level = level;
		this.views = views;
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

	public int getIshidden() {
		return ishidden;
	}

	public void setIshidden(int ishidden) {
		this.ishidden = ishidden;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPrjno() {
		return prjno;
	}
	
	public void setPrjno(String prjno) {
		this.prjno = prjno;
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
	
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getDepends() {
		return depends;
	}
	
	public void setDepends(String depends) {
		this.depends = depends;
	}
	
	public long getStart() {
		return start;
	}
	
	public void setStart(long start) {
		this.start = start;
	}
	
	public int getDuration() {
		return duration;
	}
	
	public void setDuration(int duration) {
		this.duration = duration;
	}
	
	public long getEnd() {
		return end;
	}
	
	public void setEnd(long end) {
		this.end = end;
	}
	
	public boolean isStartIsMilestone() {
		return startIsMilestone;
	}
	
	public void setStartIsMilestone(boolean startIsMilestone) {
		this.startIsMilestone = startIsMilestone;
	}
	
	public boolean isEndIsMilestone() {
		return endIsMilestone;
	}
	
	public void setEndIsMilestone(boolean endIsMilestone) {
		this.endIsMilestone = endIsMilestone;
	}
	
	
	
	public String getImportance() {
		return importance;
	}
	
	public void setImportance(String importance) {
		this.importance = importance;
	}
	
	public String getUptdate() {
		return uptdate;
	}
	
	public void setUptdate(String uptdate) {
		this.uptdate = uptdate;
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