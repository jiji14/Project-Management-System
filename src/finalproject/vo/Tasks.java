package finalproject.vo;

import java.util.ArrayList;

public class Tasks {
	//Gantt 용
	private String id;
	private String code;
	private String name;
	private long progress;
	private String description;
	private String status;
	private String depends;
	private long start;
	private long end;
	private long duration;
	private boolean startIsMilestone;
	private boolean endIsMilestone;
	private long level;
	private ArrayList<Assig> assigs;
	public Tasks() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Tasks(String id, String code, String name, long progress, String description, String status, String depends,
			long start, long end, long duration, long level) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.progress = progress;
		this.description = description;
		this.status = status;
		this.depends = depends;
		this.start = start;
		this.end = end;
		this.duration = duration;
		this.level = level;
	}


	public long getLevel() {
		return level;
	}

	public void setLevel(long level) {
		this.level = level;
	}

	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getProgress() {
		return progress;
	}
	public void setProgress(long progress) {
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
	public long getDuration() {
		return duration;
	}
	public void setDuration(long duration) {
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
	
	public ArrayList<Assig> getAssigs() {
		return assigs;
	}
	public void setAssigs(ArrayList<Assig> assigs) {
		this.assigs = assigs;
	}
		
	
}
