package finalproject.data.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.A01_MainDao;
import finalproject.vo.Board;
import finalproject.vo.MemberLog;
import finalproject.vo.Members;
import finalproject.vo.Project;
import finalproject.vo.Status;
import finalproject.vo.UiFormat;

@Service
public class A01_MainService {
	
	@Autowired(required=false)
	private A01_MainDao dao;
	
	/* 프로젝트 */
	public Project projectList(String prjno){
		return dao.projectList(prjno);
	}
	/* 멤버 */
	public ArrayList<Members> memberList(String prjno){
		return dao.memberList(prjno);
	}
	/* 멤버로그 */
	public ArrayList<MemberLog> memberLog(String prjno){
		return dao.memberLog(prjno);
	}
	/* 리스크 */
	public ArrayList<Status> riskChart(String prjno){
		return dao.riskChart(prjno);
	}
	/* UI */
	public UiFormat loadUi(String memno) {
		return dao.loadUi(memno);
	}
	
	/* UI 변경*/
	public void uiUpdate(UiFormat ui) {
		dao.uiUpdate(ui);
	}
	
	/* 게시판 */
	public ArrayList<Board> boardList(String prjno){
		return dao.boardList(prjno);
	}
}
