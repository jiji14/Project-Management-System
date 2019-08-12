package finalproject.vo;

import java.util.ArrayList;

public class Gantt {
	private ArrayList<Tasks> tasks;
	private ArrayList<Resource> resources;
	private ArrayList<Role> roles;
	private boolean canWrite;
	private boolean canDelete;
	private boolean canWriteOnParent;
	private boolean canAdd;
	
	public Gantt() {
		super();
	}

	public Gantt(ArrayList<Tasks> tasks, ArrayList<Resource> resources, ArrayList<Role> roles, boolean canWrite,
			boolean canDelete, boolean canWriteOnParent, boolean canAdd) {
		super();
		this.tasks = tasks;
		this.resources = resources;
		this.roles = roles;
		this.canWrite = canWrite;
		this.canDelete = canDelete;
		this.canWriteOnParent = canWriteOnParent;
		this.canAdd = canAdd;
	}

	public ArrayList<Tasks> getTasks() {
		return tasks;
	}

	public void setTasks(ArrayList<Tasks> tasks) {
		this.tasks = tasks;
	}

	public ArrayList<Resource> getResources() {
		return resources;
	}

	public void setResources(ArrayList<Resource> resources) {
		this.resources = resources;
	}

	public ArrayList<Role> getRoles() {
		return roles;
	}

	public void setRoles(ArrayList<Role> roles) {
		this.roles = roles;
	}

	public boolean isCanWrite() {
		return canWrite;
	}

	public void setCanWrite(boolean canWrite) {
		this.canWrite = canWrite;
	}

	public boolean isCanDelete() {
		return canDelete;
	}

	public void setCanDelete(boolean canDelete) {
		this.canDelete = canDelete;
	}

	public boolean isCanWriteOnParent() {
		return canWriteOnParent;
	}

	public void setCanWriteOnParent(boolean canWriteOnParent) {
		this.canWriteOnParent = canWriteOnParent;
	}

	public boolean isCanAdd() {
		return canAdd;
	}

	public void setCanAdd(boolean canAdd) {
		this.canAdd = canAdd;
	}
	
}
