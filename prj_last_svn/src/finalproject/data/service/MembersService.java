package finalproject.data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.MembersDao;
import finalproject.vo.Members;

@Service
public class MembersService {
	@Autowired(required = false)
	private MembersDao dao;
	//활성화 멤버 리스트 출력
	public ArrayList<Members> actMemberList(String prjno){
		return dao.actmemberList(prjno);
	}
	//비활성화 멤버 리스트 출력
	public ArrayList<Members> inactMemberList(String prjno){
		return dao.inactmemberList(prjno);
	}
	
	//prjno 포함되지 않은 멤버 리스트 출력
	public Members addMem(String id){
		System.out.println("서비스 단 넘어왔습니다.");
		System.out.println("Ctrl에서 받아온 id : "+id);
		return dao.addMem(id);
	}
	
	public void insertMembers(Members ins) {
		System.out.println("insert service");
		System.out.println("service prjno : "+ins.getPrjno());
		System.out.println("service id : "+ins.getId());
		System.out.println("service auth : "+ins.getAuth());
		
		dao.insertMembers(ins);
	}
	
	
	public void deleteMembers(int memno) {
		dao.deleteMembers(memno);
	}
	
}
