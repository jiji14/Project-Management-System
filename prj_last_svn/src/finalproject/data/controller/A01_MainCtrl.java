package finalproject.data.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import finalproject.data.service.A01_MainService;
import finalproject.vo.Member;
import finalproject.vo.MemberLog;
import finalproject.vo.Project;
import finalproject.vo.UiFormat;

@Controller
@SessionAttributes("mem")
@RequestMapping("/dashboard.do")
public class A01_MainCtrl {
	@Autowired(required=false)
	private A01_MainService service;
	
	@RequestMapping(params="method=list")
	public String dashboard(HttpSession session, Model d) {
		
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		// 프로젝트 정보
		String prjno = mem.getPrjno();
		d.addAttribute("prjList", service.projectList(prjno));

		// 멤버정보
		d.addAttribute("memList", service.memberList(prjno));
		
		// 게시판 
		d.addAttribute("boarList", service.boardList(prjno));
		
		
		return "WEB-INF\\view\\pms\\a01_main\\a01_main.jsp";
	}
	
	
	@RequestMapping(params="method=memlog")
	public String memlog(HttpSession session, Model d) {
		
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		
		//멤버로그
		//ArrayList<MemberLog> memlog = service.memberLog(prjno);
		//System.out.println("로그시작");
		//for(MemberLog m:memlog) {
		//	System.out.println("멤버로그:"+m.getMemno()+":"+m.getDone());
		//}
		String prjno = mem.getPrjno();
		d.addAttribute("memlog", service.memberLog(prjno));
		
		return "pageJsonReport";
	}

	@RequestMapping(params="method=riskChart")
	public String riskChart(HttpSession session, Model d) {
		
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		
		//리스크차트
		String prjno = mem.getPrjno();
		d.addAttribute("riskList", service.riskChart(prjno));
		System.out.println("리스크 정보넘겨주기");
		
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=uiFormat")
	public String uiFormat(HttpSession session, Model d) {
		
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		
		/* UI */
		String memno = mem.getMemno();
		d.addAttribute("uiFormat", service.loadUi(memno));
		
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=uiUpdate")
	public String uiUpdate(@RequestParam("box1") String box1,
			@RequestParam("box2") String box2,
			@RequestParam("box3") String box3,
			@RequestParam("box4") String box4,
			HttpSession session,  Model d) {
		
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		
		/* UI */
		String memno = mem.getMemno();
		UiFormat ui = new UiFormat(memno, box1, box2, box3, box4);
		
		service.uiUpdate(ui);
		
		return "redirect:/dashboard.do?method=list";
	}
	
	@RequestMapping(params="method=board")
	public String boardList(HttpSession session, Model d) {
		
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		
		//리스크차트
		String prjno = mem.getPrjno();
		d.addAttribute("boarList", service.boardList(prjno));
		
		return "pageJsonReport";
	}
}



