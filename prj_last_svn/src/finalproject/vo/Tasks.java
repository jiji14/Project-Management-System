package finalproject.vo;

import java.util.ArrayList;

public class Tasks {
	//Gantt 용
	private String id;
	private String name;
	private long progress;
	private String description;
	private String code;
	private String status;
	private String depends;
	private long start;
	private long duration;
	private long end;
	private boolean startIsMilestone;
	private boolean endIsMilestone;
	private ArrayList<Assig> assigs;
	public Tasks() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Tasks(String id, String name, long progress, String description, String code, String status, String depends,
			long start, long duration, long end, boolean startIsMilestone, boolean endIsMilestone,
			ArrayList<Assig> assigs) {
		super();
		this.id = id;
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
		this.assigs = assigs;
	}
	
	public Tasks(String id, String name, long progress, String description, String code, String status, String depends,
			long start, long duration, long end) {
		super();
		this.id = id;
		this.name = name;
		this.progress = progress;
		this.description = description;
		this.code = code;
		this.status = status;
		this.depends = depends;
		this.start = start;
		this.duration = duration;
		this.end = end;
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
