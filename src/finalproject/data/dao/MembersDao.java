package finalproject.data.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import finalproject.vo.Members;
import finalproject.vo.Project;


@Repository
public interface MembersDao {
	public ArrayList<Members> actmemberList(String prjno);
	//활성화 list와 비활성화 list
	public ArrayList<Members> inactmemberList(String prjno);
	
	public Members addMem(String id);
	
	public void insertMembers(Members ins);
	
	public void deleteMembers(Map<String, Object> map);
	
	public ArrayList<Members> selectMem(String prjno);
	
	public void actupdate(Map<String, Object> map);

	public void inactupdate(Map<String, Object> map);
	
	public void authupdate(Map<String, Object> map);
	
	// 아이디로 멤버번호 가져오기
	public ArrayList<Members> memnoList();
}
