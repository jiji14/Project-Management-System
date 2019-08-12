package finalproject.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import finalproject.data.service.A05_PermitService;
import finalproject.vo.Member;
import finalproject.vo.Members;
import finalproject.vo.Permit;

@Controller
@RequestMapping("/permit.do")
public class A05_PermitCtrl {
	
	@Autowired(required=false)
	private A05_PermitService service;
	
	
	@RequestMapping(params="method=basic")
	public String basic(HttpSession session	) {
		Member mem = (Member)session.getAttribute("mem");
		System.out.println("여기 permit이야"+mem.getAuth());
		String result = null;
		if(mem.getAuth().equals("member")) {
			System.out.println(mem.getAuth());
			result = "redirect:/permit.do?method=member";
		}else if(mem.getAuth().equals("admin")) {
			System.out.println(mem.getAuth());
			result = "redirect:/permit.do?method=admin";
		}
		return result;
	}
	// 아아 멤바다 멤바
	@RequestMapping(params="method=member") 
	public String pmList(String prjno, Model m, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		System.out.println("Memno/ctr:"+mem.getMemno());

		
		 //for(Permit per: permit) { System.out.println("여기 맞나요?"+per.getName()); }
		m.addAttribute("permit", service.pmList(mem));
		m.addAttribute("reject", service.rejectList(mem));
		m.addAttribute("done", service.doneList(mem));
		
		return "WEB-INF\\view\\pms\\a01_main\\a04_permit.jsp";
	}
	
	//pm화면이지롱
	@RequestMapping(params="method=admin") 
	public String pmchk(String prjno, Model m, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		
		
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		
		//ArrayList<Permit> permit = service.pmList(mem.getMemno());
		System.out.println("Memno/ctr:"+mem.getMemno());
		//System.out.println("데이터크기:"+service.pmList(mem.getMemno()).size());
		
		
		//for(Permit per: permit) { System.out.println("여기 맞나요?"+per.getName()); }
		m.addAttribute("pmchk", service.pmchk(mem));
		m.addAttribute("pmreject", service.pmreject(mem));
		m.addAttribute("pmdone", service.pmdone(mem));
		
		return "WEB-INF\\view\\pms\\a01_main\\a04_manager.jsp";
	}
	
	
	@RequestMapping(params="method=uptProc")
	public String uptBtn(@RequestParam("taskId") String taskid, Model m) {
		System.out.println("taskid: "+taskid);
		service.uptBtn(taskid);
		m.addAttribute("isSucc", "ok");
		  return "pageJsonReport";
	}
	// 승인 완료건에서 삭제처리
	@RequestMapping(params="method=approve")
	public String approve(@RequestParam("taskId") String taskid, Model m) {
		System.out.println("taskid: "+taskid);
		service.approve(taskid);
		m.addAttribute("isSucc", "ok");
		return "pageJsonReport";
	}
	
	
	@RequestMapping(params="method=detail")
	public String getTask(@RequestParam("taskId") String taskid, Model m) {
		System.out.println("상세화면 no"+taskid);
		

		Permit perm = service.getTask(taskid);
		System.out.println("태스크아이디: "+perm.getTaskid());
		//System.out.println("태스크이름: "+perm.getName());
		//System.out.println("멤버번호: "+perm.getMemno());
		//System.out.println("내용: "+perm.getDescription());
		//System.out.println("중요도: "+perm.getImportance());
		//System.out.println("프로젝트번호: "+perm.getPrjno());
		m.addAttribute("tasks", service.getTask(taskid));
		
		return"WEB-INF\\view\\pms\\a01_main\\a04_permitDetail.jsp";
	}

	
	@RequestMapping(params="method=manageDatail")
	public String manageTask(@RequestParam("taskId") String taskid, Model m) {
		System.out.println("상세화면 no"+taskid);
		m.addAttribute("tasks", service.getTask(taskid));
		
		return"WEB-INF\\view\\pms\\a01_main\\a04_ManagerDetail.jsp";
	}
	
	@RequestMapping(params="method=confirmProc")
	public String confirmProc(@RequestParam("taskId") String taskid, Model m) {
		service.confirmProc(taskid);
		m.addAttribute("isSucc", "ok");	
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=rejectProc")
	public String rejectProc(@RequestParam("taskId") String taskid, Model m) {
		service.rejectProc(taskid);
		m.addAttribute("isSucc", "ok");	
		return "pageJsonReport";
	}

}
