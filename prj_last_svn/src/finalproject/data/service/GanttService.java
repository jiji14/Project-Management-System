package finalproject.data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.GanttDao;
import finalproject.vo.Assig;
import finalproject.vo.ParamTasks;
import finalproject.vo.Resource;
import finalproject.vo.Role;
import finalproject.vo.Tasks;

@Service
public class GanttService {
	@Autowired(required=false)
	private GanttDao dao;
	
	
	public ArrayList<Assig> assigList(String prjno){
		return dao.assigList(prjno);
	}
	
	public ArrayList<Tasks> taskList(String prjno){
		ArrayList<ParamTasks> paramTaskList = dao.taskList(prjno);
		ArrayList<Tasks> tlist = new ArrayList<>();
		for(ParamTasks ptask : paramTaskList) {
			Tasks task = new Tasks(
					ptask.getId(),
					ptask.getName(),
					ptask.getProgress(),
					ptask.getDescription(),
					ptask.getCode(),
					ptask.getStatus(),
					ptask.getDepends(),
					ptask.getStart(),
					ptask.getDuration(),
					ptask.getEnd()
					);
			
			if(ptask.getStartIsMilestone() == 1) {
				task.setStartIsMilestone(true);
			} else {
				task.setStartIsMilestone(false);
			}
			
			if(ptask.getEndIsMilestone() == 1) {
				task.setEndIsMilestone(true);
			} else {
				task.setEndIsMilestone(false);
			}
			tlist.add(task);
		}
		
		return tlist;
	}
	
	public ArrayList<Resource> resourceList(String prjno){
		return dao.resourceList(prjno);
	}
	
	public ArrayList<Role> roleList(String prjno){
		return dao.roleList(prjno);
	}
}


