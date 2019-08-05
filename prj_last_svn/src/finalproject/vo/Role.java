package finalproject.vo;

public class Role {
	//멤버와 성질이 같다
	private String id;
	private String name;
	
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
	
}


