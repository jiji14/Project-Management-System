package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Member;
import finalproject.vo.ToDoList;

@Repository
public interface A07_ToDoDao {
	/* 전체 목록 - 숨김없음 */
	public ArrayList<ToDoList> todoList(Member member);
	public ArrayList<ToDoList> todoEmer(Member member);
	public ArrayList<ToDoList> todoDone(Member member);
	
	/* 전체 목록 - 히든 처리 */
	public ArrayList<ToDoList> hiddenList(Member member);
	public ArrayList<ToDoList> hiddenEmer(Member member);
	public ArrayList<ToDoList> hiddenDone(Member member);
	
	/* 숨김처리 및 숨김해제 */
	public void makeHidden(String taskid);
	public void makeShow(String taskid);
	
	/* 디테일 */
	public ToDoList detail(String taskid);
}
