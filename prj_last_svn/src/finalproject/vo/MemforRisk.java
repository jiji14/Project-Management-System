package finalproject.vo;

public class MemforRisk {
	private String prjno;
	private String name;
	private String auth;
	
	public MemforRisk() {
		super();
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

	public String getAuth() {
		if(auth == null) {
			auth = "member";
		}
		return auth;
	}

	public void setAuth(String auth) {
		
		this.auth = auth;
	}
	
}
