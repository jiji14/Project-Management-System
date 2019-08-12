package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Member;
import finalproject.vo.Members;
import finalproject.vo.Project;
import finalproject.vo.ProjectSch;

@Repository
public interface A04_ProjectDao {
   // 1. 조회메서드
   public ArrayList<Project> prjList(ProjectSch sch);
   // 2. 입력메서드
   public void prjInsert(Project insert);
   // 3. 상세 데이터 메서드..
   public Project prjGet(String prjno);
   // 4. 수정메서드
   public void prjUpdate(Project update);
   // 5. 삭제메서드.
   public void prjDelete(String prjno);
   // 6. 프로젝트리스트 목록뽑기
   public ArrayList<Members> actmemberList();
   // 8. 멤버추가
   public void insertMembers(Members ins);
   // 아이디로 멤버번호 가져오기
   public ArrayList<Members> memnoList();
   //프로젝트번호 세션으로 넘기기
   public String pickprj();
   
   public void memberUpt(Member mem);
   //권한 받아오기
   public String getAuth(Member mem);
   
}