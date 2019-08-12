package finalproject.vo;

public class UiFormat {
	String uino;
	String memno;
	String box1;
	String box2;
	String box3;
	String box4;
	
	
	public UiFormat() {
		super();
	}
	
	
	public UiFormat(String memno, String box1, String box2, String box3, String box4) {
		super();
		this.memno = memno;
		this.box1 = box1;
		this.box2 = box2;
		this.box3 = box3;
		this.box4 = box4;
	}


	public String getUino() {
		return uino;
	}
	public void setUino(String uino) {
		this.uino = uino;
	}
	public String getMemno() {
		return memno;
	}
	public void setMemno(String memno) {
		this.memno = memno;
	}
	public String getBox1() {
		return box1;
	}
	public void setBox1(String box1) {
		this.box1 = box1;
	}
	public String getBox2() {
		return box2;
	}
	public void setBox2(String box2) {
		this.box2 = box2;
	}
	public String getBox3() {
		return box3;
	}
	public void setBox3(String box3) {
		this.box3 = box3;
	}
	public String getBox4() {
		return box4;
	}
	public void setBox4(String box4) {
		this.box4 = box4;
	}
	
	
}
