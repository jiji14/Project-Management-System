package finalproject.data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.A07_ToDoDao;
import finalproject.vo.Member;
import finalproject.vo.ToDoList;

@Service
public class A07_TodoService {
	@Autowired(required=false)
	private A07_ToDoDao dao;
	
	/* 리스트 3개 */
	public ArrayList<ToDoList> todoList(Member member){
		return dao.todoList(member);
	}
	public ArrayList<ToDoList> todoEmer(Member member){
		return dao.todoEmer(member);
	}
	public ArrayList<ToDoList> todoDone(Member member){
		return dao.todoDone(member);
	}
	
	
	/* 리스트 3개 - 히든 처리*/
	public ArrayList<ToDoList> hiddenList(Member member){
		return dao.hiddenList(member);
	}
	public ArrayList<ToDoList> hiddenEmer(Member member){
		return dao.hiddenEmer(member);
	}
	public ArrayList<ToDoList> hiddenDone(Member member){
		return dao.hiddenDone(member);
	}
	
	/* 숨김처리 및 숨김해제 */
	public void makeHidden(String taskid) {
		dao.makeHidden(taskid);
	}
	public void makeShow(String taskid) {
		dao.makeShow(taskid);
	}
}
