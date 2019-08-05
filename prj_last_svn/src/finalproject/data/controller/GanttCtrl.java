package finalproject.data.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import finalproject.data.service.GanttService;
import finalproject.vo.Assig;
import finalproject.vo.Gantt;
import finalproject.vo.Member;
import finalproject.vo.Resource;
import finalproject.vo.Role;
import finalproject.vo.Tasks;


@Controller
@SessionAttributes("mem")
@RequestMapping("/task.do")
public class GanttCtrl {
	@Autowired(required=false)
	private GanttService service;
	
	//task.do?method=list
	@RequestMapping(params="method=list")
	public String gantList() {
		return "WEB-INF\\view\\pms\\a01_main\\a10_task.jsp";
	}

	//task.do?method=data
	@RequestMapping(params="method=data")
	public String revData(HttpSession session, Model d) throws ParseException {
		
		Member mem = (Member)session.getAttribute("mem");
		String prjno= "pro10100";
		System.out.println("받은 프로젝트 번호:"+prjno);
		
		ArrayList<Assig> assigList = service.assigList(prjno);
		ArrayList<Role> roleList = service.roleList(prjno) ;
		ArrayList<Resource> resourceList = service.resourceList(prjno);
		ArrayList<Tasks> taskList = service.taskList(prjno);
		
		System.out.println("assig 사이즈 확인:"+assigList.size());
		
		//System.out.println(taskList.size());
		//Task 에 assig 할당
		int idx = 0;
	    for(Tasks tasks : taskList) {
	    	ArrayList<Assig> alist = new ArrayList<Assig>();
	    	//System.out.println("포문 진입");
	       //System.out.println(assigList.size());
	    	
	       for(Assig as : assigList) {
	    	   System.out.println("taskId:"+tasks.getId());
	    	   System.out.println("assigId:"+as.getTaskId());
	          if(as.getTaskId().equals(tasks.getId())) {
	        	  
	             System.out.println("taskId 비교문 진입");
	             Assig assig = new Assig();
	             assig.setId(as.getId());
	             assig.setResourceId(as.getResourceId());
	             assig.setCode(as.getCode());
	             assig.setRoleId(as.getRoleId());
	             assig.setEffort(as.getEffort());
	             assig.setTaskId(as.getTaskId());
	             alist.add(assig);
	             System.out.println("assig id 입력 값 :"+assig.getId());
	             
	          }
	       }
	       System.out.println("if 문 성공적으로 종료");
	       taskList.get(idx).setAssigs(alist);
	       System.out.println("업무에 성공적으로 Assig 주입");
	       idx++;
	       System.out.println("Assig = [] 이라도 넘어가자");
	    }
		System.out.println("for 문 성공");
		/*Gantt*/
		
	    Gantt gantt = new Gantt(taskList, resourceList, roleList, true, true, true, true);
	    System.out.println("VO 생성 완료");
	    d.addAttribute(gantt);
	    System.out.println("gantt : "+gantt);
		return "pageJsonReport";
	}
}




