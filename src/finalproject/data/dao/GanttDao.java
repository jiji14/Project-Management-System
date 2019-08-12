package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Assig;
import finalproject.vo.Gantt;
import finalproject.vo.ParamTasks;
import finalproject.vo.Resource;
import finalproject.vo.Role;
import finalproject.vo.Tasks;

@Repository
public interface GanttDao {
	
	
	public ArrayList<Gantt> ganttList(String prjno);
	
	public ArrayList<ParamTasks> taskList(String prjno);
	
	public ArrayList<Role> roleList(String prjno);
	
	public ArrayList<Resource> resourceList(String prjno);
	
	public ArrayList<Assig> assigList(String prjno);
	
	public void insertGantt(String data, String code);
	
	public void insertTasks(ParamTasks ins);
	
	public void insertRole(Role ins);
	
	//public void insertResource(Resource ins);
	
	public void insertAssig(Assig ins);
	
	public void deleteTasks(String code);
	
	//public void deleteResource(String code); 
	
	public void deleteRole(String code);
	
	public void deleteAssig(String code);
}
