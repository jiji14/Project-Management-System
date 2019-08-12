package finalproject.vo;

public class Role {
	//멤버와 성질이 같다
	private String id;   //membern
	private String name; //권한
	private String memno;
	private String code;
	
	
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public Role() {
		super();
	}
	public Role(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Role(String id, String name, String memno, String code) {
		super();
		this.id = id;
		this.name = name;
		this.memno = memno;
		this.code = code;
	}
	
}


