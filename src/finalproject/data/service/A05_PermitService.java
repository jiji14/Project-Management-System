package finalproject.data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.A05_PermitDao;
import finalproject.vo.Member;
import finalproject.vo.Permit;

@Service
public class A05_PermitService {
	
	@Autowired(required=false)
	private A05_PermitDao dao;
	
	//미승인
	public ArrayList<Permit> pmList(Member mem){
		System.out.println("까꿍2");
		return dao.pmList(mem);
	};
	//반려
	public ArrayList<Permit> rejectList(Member mem){
		return dao.rejectList(mem);
	}
	//승인
	public ArrayList<Permit> doneList(Member mem){
		return dao.doneList(mem);
	}
	public void uptBtn(String taskid) {
		dao.uptBtn(taskid);
	};
	// 승인완료에서 삭제(안보이기)
	public void approve(String taskid) {
		dao.approve(taskid);
	};
	public Permit getTask(String taskid) {
		return dao.getTask(taskid);
	};
	public ArrayList<Permit> pmchk(Member mem){
		return dao.pmchk(mem);
	}
	public ArrayList<Permit> pmreject(Member mem){
		return dao.pmreject(mem);
	}
	public ArrayList<Permit> pmdone(Member mem){
		return dao.pmdone(mem);
	}
	
	public void confirmProc(String taskid) {
		dao.confirmProc(taskid);
	}
	
	public void rejectProc(String taskid) {
		dao.rejectProc(taskid);
	}
}
