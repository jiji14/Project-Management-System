package finalproject.data.dao;


import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Board;
import finalproject.vo.MemberLog;
import finalproject.vo.Members;
import finalproject.vo.Project;
import finalproject.vo.Status;
import finalproject.vo.UiFormat;

@Repository
public interface A01_MainDao {
	
	/* 프로젝트정보 */
	public Project projectList(String prjno);
	
	/* 멤버정보 */
	public ArrayList<Members> memberList(String prjno);
	
	/* 멤버별 업무로그 */
	public ArrayList<MemberLog> memberLog(String prjno);
	
	/* 리스크정보 */
	public ArrayList<Status> riskChart(String prjno);
	
	/* 대쉬보드 ui 불러오기 */
	public UiFormat loadUi(String memno);
	
	/* 대쉬보드 ui 업로드 */
	public void uiUpdate(UiFormat ui);
	
	/* 게시판 불러오기 */
	public ArrayList<Board> boardList(String prjno);
}
