package finalproject.vo;

public class Resource {
	//resource table gid, id, name 
	//회원과 성질이 같음 gid만 추가하면 된다.
	private String id;
	private String name;
	private String code;
	
	
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
	public Resource() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Resource(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Resource(String id, String name, String code) {
		super();
		this.id = id;
		this.name = name;
		this.code = code;
	}
	
}
