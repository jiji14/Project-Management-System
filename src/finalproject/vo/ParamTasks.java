package finalproject.vo;

import java.util.ArrayList;

public class ParamTasks {
	//전송용 
	private String id;
	private String code;
	private String name;
	private long progress;
	private String description;
	private String status;
	private String depends;
	private long start;
	private long duration;
	private long end;
	
	private long startIsMilestone;
	private long endIsMilestone;
	private long level;
	
	public ParamTasks() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	public ParamTasks(String id, String code, String name, long progress, String description, String status,
			String depends, long start, long end, long duration, long level) {
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





	public ParamTasks(String id, String code, String name, long progress, String description, String status,
			String depends, long start, long end, long duration, long startIsMilestone, long endIsMilestone,
			long level) {
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
		this.startIsMilestone = startIsMilestone;
		this.endIsMilestone = endIsMilestone;
		this.level = level;
	}

	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public long getEnd() {
		return end;
	}
	public void setEnd(long end) {
		this.end = end;
	}
	public long getDuration() {
		return duration;
	}
	public void setDuration(long duration) {
		this.duration = duration;
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
	public long getLevel() {
		return level;
	}
	public void setLevel(long level) {
		this.level = level;
	}
	

}
