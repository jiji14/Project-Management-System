package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Member;
import finalproject.vo.Members;
import finalproject.vo.MemforRisk;
import finalproject.vo.Posibility;
import finalproject.vo.Rgsdte;
import finalproject.vo.Risk;
import finalproject.vo.Riskdegree;
import finalproject.vo.Status;
import finalproject.vo.TaskforRisk;

@Repository
public interface A06_RiskDao {
	// 1. 전체리스트 조회
	public ArrayList<Risk> riskList(String prjno);
	// 1-1. 위험도 차트
	public ArrayList<Riskdegree> degreeCount(String prjno);
	// 1-2. 가능성 차트
	public ArrayList<Posibility> posibleCount(String prjno);	
	// 1-3. 등록날짜 차트
	public ArrayList<Rgsdte> rgsdteCount(String prjno);
	// 1-4. 상태 차트
	public ArrayList<Status> statusCount(String prjno);
	
	// 2. 상세 조회
	public Risk riskDetail(String riskno);
	
	// 3. 등록
	public void riskInsert(Risk risk);
	
	// 3-1. 등록시에 taskname 보여주는
	public ArrayList<TaskforRisk> taskList(String prjno);
	public ArrayList<Members> mnameList(String prjno);
	
	// 4. 수정
	public void riskUpdate(Risk risk);
	
	// 5. 삭제
	public void riskDelete(String riskno);
	
	// 멤버 권한
	public MemforRisk memAuth(Member mem);
}
