package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Assig;
import finalproject.vo.Gantt;
import finalproject.vo.ParamTasks;
import finalproject.vo.Resource;
import finalproject.vo.Role;

@Repository
public interface GanttDao {
	
	public ArrayList<Gantt> ganttList(String prjno);
	
	public ArrayList<ParamTasks> taskList(String prjno);
	
	public ArrayList<Role> roleList(String prjno);
	
	public ArrayList<Resource> resourceList(String prjno);
	
	public ArrayList<Assig> assigList(String prjno);
	
	
}
