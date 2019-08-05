package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Members;


@Repository
public interface MembersDao {
	public ArrayList<Members> actmemberList(String prjno);
	//활성화 list와 비활성화 list
	public ArrayList<Members> inactmemberList(String prjno);
	
	public Members addMem(String id);
	
	public void insertMembers(Members ins);
	
	public void deleteMembers(int memno);

}
