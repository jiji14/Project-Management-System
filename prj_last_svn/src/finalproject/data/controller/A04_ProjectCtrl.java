package finalproject.data.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import finalproject.data.service.A04_ProjectService;
import finalproject.data.service.MembersService;
import finalproject.vo.Member;
import finalproject.vo.MemberReg;
import finalproject.vo.Members;
import finalproject.vo.Project;

@Controller
@RequestMapping("/project.do")
public class A04_ProjectCtrl {
	/*
	public String call() {
		return "WEB-INF\\view\\pms\\a01_main\\a04_project.jsp";
	}
		*/
	@Autowired(required=false)
	private A04_ProjectService service;
	private MembersService mservice;
	
	
	@ModelAttribute("mem") //다른 페이지 이동해도 정보 가지고 있는
	public Member getMember() {
		return new Member();
	}
	
	@RequestMapping(params="method=list")
	public String prjList(Project sch, Model m,HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		System.out.println(mem.getMemno());
		m.addAttribute("project", service.prjList(mem.getMemno()));
		
		
		return "WEB-INF\\view\\pms\\a01_main\\a04_project.jsp";
	}
	
	
	@RequestMapping(params="method=insertForm")
	   public String form(@ModelAttribute("project") Project sch,
			             @ModelAttribute("members") Members mem ,Model d) {
		ArrayList<Members> actmems = service.actmemberList();
		d.addAttribute("addMem",actmems);
		//System.out.println("여긴 성공~");
	    
		return "WEB-INF\\view\\pms\\a01_main\\a04_projectReply.jsp";
	   }
	
	@RequestMapping(params="method=overlap")
	public String form(@RequestParam("idVal") String idVal,Model m) {
		System.out.println("호출!!");
		System.out.println(idVal);
		ArrayList<Members> memnoList = service.memnoList();
		String memno = "";
		for(Members a : memnoList) {
			if(idVal.equals(a.getId())) {
				System.out.println(a.getId());
				memno = a.getMemno();
				System.out.println("중복");
				System.out.println(a.getMemno());
				m.addAttribute("memno",memno);
			}else {
				System.out.println("사용가능");
			}
		}
		System.out.println(memno);
		return "pageJsonReport";
		
		//System.out.println("여긴 성공~");
		
	}

	/*
	@RequestMapping(params="method=delete")
	public String prjDelete(@RequestParam("prjno") String prjno) {
		System.out.println("삭제번호:"+prjno);
		service.prjDelete(prjno);
		
		return "redirect:/project.do?method=list";
	}
		
		
		
		
		*/
	@RequestMapping(params="method=insert")
	public String prjInsert(@ModelAttribute("project") Project ins, Model m) {
		System.out.println("프로젝트번호: "+ins.getPrjno());
		System.out.println("프로젝트이름: "+ins.getPrjname());
		System.out.println("시작일: "+ins.getStdate());
		System.out.println("마감일: "+ins.getDuedate());
		System.out.println("담당자: "+ins.getPrjadmin());
		System.out.println("카테고리: "+ins.getCategory());
		System.out.println("범위: "+ins.getPermission());
		System.out.println("클라이언트: "+ins.getClient());
		
		service.prjInsert(ins);
		System.out.println("ok");
		
		System.out.println(service.pickprj());
		m.addAttribute("pro",service.pickprj());
		//return "forward:/project.do?method=addMem";
		return "pageJsonReport";
	}

	
	@RequestMapping(params="method=detail")
	public String prjGet(@RequestParam("prjno") String prjno, Model m) {
		System.out.println("상세화면 no:"+prjno);
		m.addAttribute("project", service.prjGet(prjno));
		
		return "WEB-INF\\view\\pms\\a01_main\\a04_detail.jsp";
	}
	
	@RequestMapping(params="method=update")
	public String prjUpdate(@ModelAttribute("project") Project update) {
	//form:form쓸때 @modelAttribute로 매핑시켜줘야함
	// service로 실행만 시켜줌
		//System.out.println("수정 번호: "+update.getPrjno());
		
		String prjno = update.getPrjno();
		System.out.println("prjno:"+prjno);
		update=service.prjUpdate(update);
		System.out.println("getPrjname:"+update.getPrjname());
		
		return "WEB-INF\\view\\pms\\a01_main\\a04_detail.jsp";
	}
	
	@RequestMapping(params="method=delete")
	public String prjDelete(@RequestParam("prjno") String prjno) {
		System.out.println("삭제번호:"+prjno);
		service.prjDelete(prjno);
		
		return "redirect:/project.do?method=list";
	}
	@RequestMapping(params="method=minsert")
	public String insertMembers(@ModelAttribute("members") MemberReg ins, Model m) {
		System.out.println("받아왔나요?"+ins.getMemno().length);
		service.insertMembers(ins);
		
		
		/*
		Members mem;
		for(int idx=0;idx<ins.getMembern().length;idx++) {
			String membern = ins.getMembern()[idx];
			String mmemno = ins.getMemno()[idx];
			String prjno = ins.getPrjno()[idx];
			String auth = ins.getAuth()[idx];
			String activation = ins.getActivation()[idx];
			System.out.println("멤버번호: "+membern);
			System.out.println("회원번호: "+mmemno);
			System.out.println("프로젝트번호: "+prjno);
			System.out.println("권한: "+auth);
			System.out.println("활성: "+activation);
			
			//service.insertMembers(ins);
			System.out.println("담겻냐");
		}
		*/
		
		return "redirect:/project.do?method=list";
	}
	
	
	///이거가 세션을 도전하는것이야
	
	  @RequestMapping(params="method=proc") 
	  public String proc(@RequestParam("prjproc") String prjproc, HttpSession session, Model m) { 
		  System.out.println("prjno: "+prjproc);
		  Member mem = (Member)session.getAttribute("mem");
		  System.out.println("여기까진가1"+mem.getPrjno());
	  if(prjproc==null) {
		  return "";
	  }
	  mem.setPrjno(prjproc);
	  System.out.println("set한 값이고 "+mem.getPrjno());
	  System.out.println("memno값이고 "+mem.getMemno());
	  service.memberUpt(mem);
	  System.out.println("들어갔나:"+mem.getPrjno());
	  System.out.println("받아왔나요"+mem.getMemno());
	  m.addAttribute("mem",mem);
	  
	  //return "forward:/project.do?method=list";
	  return "pageJsonReport";
	  }
	 
}

