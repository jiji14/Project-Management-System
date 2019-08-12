package finalproject.data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.A04_ProjectDao;
import finalproject.vo.Member;
import finalproject.vo.MemberReg;
import finalproject.vo.Members;
import finalproject.vo.Project;
import finalproject.vo.ProjectSch;

@Service
public class A04_ProjectService {
   
   @Autowired(required=false)
   private A04_ProjectDao dao;
   
   public ArrayList<Project> prjList(ProjectSch sch){
      return dao.prjList(sch);
   }
   
   public void prjInsert(Project insert) {
      dao.prjInsert(insert);
   }
   
   public Project prjGet(String prjno) {
      return dao.prjGet(prjno);
   }
   
   public Project prjUpdate(Project update) {
      dao.prjUpdate(update);
      return dao.prjGet(update.getPrjno());
   }
   
   public void prjDelete(String prjno) {
      dao.prjDelete(prjno);
   }
   
   public ArrayList<Members> actmemberList(){
      return dao.actmemberList();
   }
   /// member서비스
   public void insertMembers(MemberReg ins){
      System.out.println("서비스단에서 들어갔나요?");
      String[] memnostr = ins.getMemno();
      String[] prjnostr = ins.getPrjno();
      String[] authstr = ins.getAuth();
      System.out.println("길이"+authstr.length);
      
      for(int idx=0;idx<authstr.length;idx++) {
         dao.insertMembers(new Members(memnostr[idx],prjnostr[idx],authstr[idx]));
      }
      System.out.println("digh");
   }
   
   public String pickprj() {
      return dao.pickprj();
   };
   // 아이디로 멤버번호 가져오기
   public ArrayList<Members> memnoList(){
      System.out.println("서비스단 진입");
      return dao.memnoList();
   };
   // 
   public void memberUpt(Member mem) {
      System.out.println("이것이 되는것이냐");
      dao.memberUpt(mem);
   }
   
   //멤버 권한 받아오기
   public String getAuth(Member mem) {
      return dao.getAuth(mem);
   };
}