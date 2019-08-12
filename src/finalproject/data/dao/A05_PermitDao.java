package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Member;
import finalproject.vo.Permit;
import finalproject.vo.Tasks;

@Repository
public interface A05_PermitDao {
	// 일반멤버 미승인 리스트
	public ArrayList<Permit> pmList(Member mem);
	// 미승인 요청건 확인으로 바꿔주기
	public void uptBtn(String taskid);
	// 상세보기
	public Permit getTask(String taskid);
	// 반려건
	public ArrayList<Permit> rejectList(Member mem);
	// 완료건
	public ArrayList<Permit> doneList(Member mem);
	// pm 미승인 리스트
	public ArrayList<Permit> pmchk(Member mem);	
	// pm 반려 리스트
	public ArrayList<Permit> pmreject(Member mem);	
	// pm 승인 리스트
	public ArrayList<Permit> pmdone(Member mem);	
	// 승인완료에서 삭제(안보이기)
	public void approve(String taskid);
	
	
	public void confirmProc(String taskid);
	
	public void rejectProc(String taskid);
}
