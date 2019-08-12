package finalproject.data.service;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
					ptask.getCode(),
					ptask.getName(),
					ptask.getProgress(),
					ptask.getDescription(),
					ptask.getStatus(),
					ptask.getDepends(),
					ptask.getStart(),
					ptask.getEnd(),
					ptask.getDuration(),
					ptask.getLevel()
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
		System.out.println("service "+prjno);
		ArrayList<Resource> resource = dao.resourceList(prjno);
		for(Resource rs : resource) {
			rs.setCode(prjno);
		}
		return resource;
	}
	
	public ArrayList<Role> roleList(String prjno){
		System.out.println("service "+prjno);
		ArrayList<Role> role = dao.roleList(prjno);
		for(Role rs : role) {
			rs.setCode(prjno);
		}
		return role;
	}
	
	
	
	
	//간트 입력 
	public void insertGantt(String data, String code) throws ParseException {
		 JSONParser parser = new JSONParser();
		 // 제이슨 오브젝트 변환
	     JSONObject jobj = (JSONObject)parser.parse(data); 
	     // 각 배열들을 json객체로 가져온다
	     JSONArray jarrayTask = (JSONArray)jobj.get("tasks");
	     JSONArray jarrayRole = (JSONArray)jobj.get("roles");
	     JSONArray jarrayResource = (JSONArray)jobj.get("resources");
	     
	     
	     System.out.println("resource 배열 수 : "+jarrayResource.size());
	     System.out.println("role 배열 수 : "+jarrayRole.size());
	     System.out.println("task 배열 수 : "+jarrayTask.size());
	     System.out.println("role : "+jarrayRole);
	     System.out.println("resource : "+jarrayResource);
	     System.out.println("task : "+jarrayTask);
	     System.out.println(code);
	  // Resource 저장
	     /*
	      for(int i = 0; i < jarrayResource.size(); i++) {
	    	 //Member 배열의 수만큼 반복문
	         JSONObject ob =  (JSONObject)jarrayResource.get(i);
	         Resource rs = new Resource();
	         //객체 생성
	         
	         rs.setId((String)ob.get("id"));
	         rs.setName((String)ob.get("name"));
	         
	         System.out.println(rs.getId());
	         System.out.println(rs.getName());
	         // dao.insertResource(rs);
	         // System.out.println(ob.get("id")+":"+ob.get("name"));
	         System.out.println("Resource save");
	         
	         dao.insertResource(new Resource( (String)ob.get("id"),(String)ob.get("name") ));
	      }
	      */
	      
	      // Role 저장
	      for(int i = 0; i < jarrayRole.size(); i++) {
	    	 System.out.println("role for 문 진입 성공 ");
	         JSONObject ob =  (JSONObject)jarrayRole.get(i);
	         Role role = new Role();
	         //System.out.println(code);
	         
	         
	         JSONObject ol =  (JSONObject)jarrayResource.get(i);
	         
	         //System.out.println(ol.get("id"));
	         
	         String codes = code;
	         String ids = (String)ol.get("id");
	         
	         role.setId( (String)ob.get("id"));
	         role.setName( (String)ob.get("name"));
	         role.setCode(codes);
	         role.setMemno(ids);
	         
	         System.out.println("role에 입력한 멤버 번호 "+role.getId());
	         System.out.println("role에 입력한 권한 "+role.getName());
	         System.out.println("role에 입력한 프로젝트 번호 "+role.getCode());
	         System.out.println("role에 입력한 회원 번호 "+role.getMemno());
	         
	         System.out.println("Role save");
	         dao.insertRole(role);
	      }
	      
	      // Assig 저장
	      
	      for(int i = 0; i < jarrayTask.size(); i++) {
	    	 System.out.println("assig for 문 진입 성공 ");
	         JSONObject ob = (JSONObject)jarrayTask.get(i);
	         String taskid = (String)ob.get("id");
	         System.out.println("taskid "+taskid);
	         
	         
	         JSONArray arob = (JSONArray)ob.get("assigs");
	         for(int j = 0; j < arob.size(); j++) {
	            JSONObject assigOB = (JSONObject)arob.get(j);
	            Assig assig = new Assig();
	             System.out.println(i + "번째 task " + j + "번째 assigs resourceId : " + assigOB.get("resourceId"));
	             System.out.println(i + "번째 task " + j + "번째 assigs id : " + assigOB.get("id"));
	             System.out.println(i + "번째 task " + j + "번째 assigs roleId : " + assigOB.get("roleId"));
	             System.out.println(i + "번째 task " + j + "번째 assigs effort : " + assigOB.get("effort"));
	            
	        
	            assig.setResourceId((String)assigOB.get("resourceId"));
	            assig.setId((String)assigOB.get("id"));
	            assig.setRoleId((String)assigOB.get("roleId"));
	            assig.setEffort((long)assigOB.get("effort"));
	            assig.setTaskId(taskid);
	            assig.setCode(code);
	            
	            System.out.println("assig에 입력한 프로젝트 번호 "+assig.getCode());
	            System.out.println("assig에 입력한 assigsid "+assig.getId());
	            System.out.println("assig에 입력한 taskid "+assig.getTaskId());
	            System.out.println("assig에 입력한 roleid "+assig.getRoleId());
	            System.out.println("assig에 입력한 resourceid "+assig.getResourceId());
	            
	            //code session 처리 (prjno)
	            System.out.println("assig save");
	            dao.insertAssig(assig);
	            
	           
	         }
	      }
	      
	      // Task 저장
	      System.out.println("task 사이즈 : " + jarrayTask.size());
	      for(int i = 0; i < jarrayTask.size(); i++) {
	         JSONObject job = (JSONObject)jarrayTask.get(i);
	         JSONArray jarrayAssig = (JSONArray)jobj.get("assigs");
	         
	         // boolean타입을 전환하기 위한 변수
	         long startIsMilestone;
	         long endIsMilestone;
	         
	         if((boolean)job.get("startIsMilestone")) {
	            startIsMilestone = 1;
	         } else {
	            startIsMilestone = 0;
	         }
	         
	         if((boolean)job.get("endIsMilestone")) {
	            endIsMilestone = 1;
	         } else {
	            endIsMilestone = 0;
	         }
	         
	         System.out.println("시작일 고정 여부 : "+startIsMilestone);
	         System.out.println("마감일 고정 여부 : "+startIsMilestone);
	         System.out.println("ctrl에서 준 prjno : "+code);
	         System.out.println();
	        
	         ParamTasks task = new ParamTasks(
	                  (String)job.get("id"),
	                  (String)job.get("code"),
	                  (String)job.get("name"),
	                  (long)job.get("progress"),
	                  (String)job.get("description"),
	                  (String)job.get("status"),
	                  (String)job.get("depends"),
	                  (long)job.get("start"),
	                  (long)job.get("end"),
	                  (long)job.get("duration"),
	                  startIsMilestone,
	                  endIsMilestone,
	                  (long)job.get("level")
	               );
	         	
	         	 task.setCode(code);
	         

	        	 System.out.println("code : "+task.getCode());
	        	 System.out.println(task.getId());
		         System.out.println(task.getName());
		         System.out.println(task.getProgress());
		         System.out.println(task.getDescription());
		         System.out.println(task.getDuration());
		         System.out.println("depends : "+task.getDepends());
		         System.out.println(task.getLevel());
		         System.out.println(task.getStart());
		         System.out.println(task.getEnd());
		         System.out.println(task.getStartIsMilestone());
		         System.out.println(task.getStatus());

	         System.out.println(task.getId());
	         System.out.println(task.getName());
	         System.out.println(task.getProgress());
	         System.out.println(task.getDescription());
	         System.out.println(task.getDuration());
	         System.out.println("depends : "+task.getDepends());
	         System.out.println(task.getLevel());
	         System.out.println(task.getStart());
	         System.out.println(task.getEnd());
	         System.out.println(task.getStartIsMilestone());
	         System.out.println(task.getStatus());

	         task.setCode(code);
	         System.out.println(task.getId());
	         System.out.println(task.getName());
	         System.out.println(task.getProgress());
	         System.out.println(task.getDescription());
	         System.out.println(task.getDuration());
	         System.out.println("depends : "+task.getDepends());
	         System.out.println(task.getLevel());
	         System.out.println(task.getStart());
	         System.out.println(task.getEnd());
	         System.out.println(task.getStartIsMilestone());
	         System.out.println(task.getStatus());

	         
	         
	         
	         
	         
	         System.out.println("task 저장 확인 : "+task);
	         dao.insertTasks(task);
	         
	      } // end Task for
	      
	      
	      
	   } // end insertGantt
	   
		//저장을 위한 전체 DB 데이터 삭제 
	   	public void deleteTasks(String code) {
	   		System.out.println("삭제할 prjno : "+code);
	   		
		      dao.deleteTasks(code);
		}
	   
	   	/*
		public void deleteResource(String code) {
		      dao.deleteResource(code);
		}
		*/
	   	
		public void deleteRole(String code) {
			System.out.println("삭제할 prjno : "+code);
		      dao.deleteRole(code);
		}
		
		public void deleteAssig(String code) {
			System.out.println("삭제할 prjno : "+code);
		      dao.deleteAssig(code);
		}
		
	
	
	
}
