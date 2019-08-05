package finalproject.data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.A06_RiskDao;
import finalproject.vo.Member;
import finalproject.vo.Members;
import finalproject.vo.MemforRisk;
import finalproject.vo.Posibility;
import finalproject.vo.Rgsdte;
import finalproject.vo.Risk;
import finalproject.vo.Riskdegree;
import finalproject.vo.Status;
import finalproject.vo.TaskforRisk;

@Service
public class A06_RiskService {
	@Autowired(required=false)
	private A06_RiskDao dao;
	
	// 1. 전체리스트 조회
	public ArrayList<Risk> riskList(String prjno){
		return dao.riskList(prjno);
	}
	
	// 1-1. 위험도
	public ArrayList<Riskdegree> degreeCount(String prjno) {
		return dao.degreeCount(prjno);
	}
	// 1-2. 가능성
	public ArrayList<Posibility> posibleCount(String prjno){
		return dao.posibleCount(prjno);
	}
	// 1-3. 등록날짜
	public ArrayList<Rgsdte> rgsdteCount(String prjno){
		return dao.rgsdteCount(prjno);
	}
	// 1-4. 상태
	public ArrayList<Status> statusCount(String prjno){
		return dao.statusCount(prjno);
	}

	// 2. 상세 조회
	public Risk riskDetail(String riskno) {
		return dao.riskDetail(riskno);
	}
	
	// 3. 등록
	public void riskInsert(Risk risk) {
		dao.riskInsert(risk);
	}
	// 3. 등록시 taskname 보여줌
	public ArrayList<TaskforRisk> taskList(String prjno) {
		return dao.taskList(prjno);
	}
	// 3. 등록시 mname 보여줌
	public ArrayList<Members> mnameList(String prjno){
		return dao.mnameList(prjno);
	}
	
	// 4. 업데이트
	public void riskUpdate(Risk risk) {
		dao.riskUpdate(risk);
	}
	
	// 5. 삭제
	public void riskDelete(String riskno) {
		dao.riskDelete(riskno);
	}
	
	// 멤버 권한
	public MemforRisk memAuth(Member mem) {
		System.out.println("서비스진입!");
		return dao.memAuth(mem);
	}
	
}
