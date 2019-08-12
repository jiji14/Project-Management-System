package finalproject.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/*
<form>
	<input name="prjno"/><input name="memno"/>
	<input name="prjno"/><input name="memno"/>

dao
service
for(int idx=0;idx<..
   String prjno = ..getPrjno()[idx]
   String memno = ..getPrjno()[idx]
   
   
   ins =new Member(....
   dao.insertMember(ins)
*/

public class MemberReg {
	
	private String [] memno;
	private String [] prjno;
	private String [] auth;
	public MemberReg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberReg(String[] memno, String[] prjno, String[] auth) {
		super();
		this.memno = memno;
		this.prjno = prjno;
		this.auth = auth;
	}
	public String[] getMemno() {
		return memno;
	}
	public void setMemno(String[] memno) {
		this.memno = memno;
	}
	public String[] getPrjno() {
		return prjno;
	}
	public void setPrjno(String[] prjno) {
		this.prjno = prjno;
	}
	public String[] getAuth() {
		return auth;
	}
	public void setAuth(String[] auth) {
		this.auth = auth;
	}
	
	
}





















