package finalproject.vo;

public class Assig {
	private String id;   
	private String resourceId;
	private String code;
	private String roleId;   
	private long effort;
	private String taskId;
   
	public Assig() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Assig(String id, String resourceId, String code, String roleId, int effort, String taskId) {
		super();
		this.id = id;
		this.resourceId = resourceId;
		this.code = code;
		this.roleId = roleId;
		this.effort = effort;
		this.taskId = taskId;
	}

	public Assig(String id, String resourceId, String code, String roleId) {
		super();
		this.id = id;
		this.resourceId = resourceId;
		this.code = code;
		this.roleId = roleId;
	}
	
	
	
	
	public Assig(String resourceId, String code, String roleId, int effort) {
		super();
		this.resourceId = resourceId;
		this.code = code;
		this.roleId = roleId;
		this.effort = effort;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	
	public long getEffort() {
		return effort;
	}

	public void setEffort(long effort) {
		this.effort = effort;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}   
	   
	
   
}