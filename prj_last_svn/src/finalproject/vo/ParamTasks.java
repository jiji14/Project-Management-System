package finalproject.vo;

import java.util.ArrayList;

public class ParamTasks {
	//전송용 
	private String id;
	private String name;
	private int progress;
	private String description;
	private String code;
	private String status;
	private String depends;
	private long start;
	private long duration;
	private long end;
	private long startIsMilestone;
	private long endIsMilestone;
	private ArrayList<Assig> assigs;
	public ParamTasks() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ParamTasks(String id, String name, int progress, String description, String code, String status,
			String depends, long start, long duration, long end, long startIsMilestone, long endIsMilestone,
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
	public long getStartIsMilestone() {
		return startIsMilestone;
	}
	public void setStartIsMilestone(long startIsMilestone) {
		this.startIsMilestone = startIsMilestone;
	}
	public long getEndIsMilestone() {
		return endIsMilestone;
	}
	public void setEndIsMilestone(long endIsMilestone) {
		this.endIsMilestone = endIsMilestone;
	}
	public ArrayList<Assig> getAssigs() {
		return assigs;
	}
	public void setAssigs(ArrayList<Assig> assigs) {
		this.assigs = assigs;
	}
	
	
}
