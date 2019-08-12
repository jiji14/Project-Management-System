package finalproject.data.service;

import java.util.ArrayList;
import java.util.Map;

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
	
	//prjno 포함되지 않은 멤버 출력
	public Members addMem(String id){
		//System.out.println("서비스 단 넘어왔습니다.");
		//System.out.println("Ctrl에서 받아온 id : "+id);
		return dao.addMem(id);
	}
	
	//등록 버튼 클릭 시 멤버 DB에 입력 
	public void insertMembers(Members ins) {
		//System.out.println("insert service");
		//System.out.println("service prjno : "+ins.getPrjno()); 
		//System.out.println("service id : "+ins.getId()); 
		//System.out.println("service auth : "+ins.getAuth()); 
		
		
		dao.insertMembers(ins);
	}
	
	public ArrayList<Members> selectMem(String prjno){
		//System.out.println(prjno); 
		
		return dao.selectMem(prjno);
	}
	
	
	public void deleteMembers(Map<String, Object> map) {
		
		dao.deleteMembers(map);
	}
	
	public void actupdate(Map<String, Object> map) {
		
		dao.actupdate(map);
	}
	
	public void inactupdate(Map<String, Object> map) {
		
		//System.out.println("service 단 들어옴");
		//System.out.println(map);
		dao.inactupdate(map);
		
	}
	
	public void authupdate(Map<String, Object> map) {
		dao.authupdate(map);
	}
	
	/* 멤버 검증 */
	public ArrayList<Members> memnoList(){
		System.out.println("서비스단 진입");
		return dao.memnoList();
	};
}
