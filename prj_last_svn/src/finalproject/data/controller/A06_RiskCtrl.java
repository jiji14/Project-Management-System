package finalproject.data.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import finalproject.data.service.A06_RiskService;
import finalproject.vo.Member;
import finalproject.vo.Members;
import finalproject.vo.MemforRisk;
import finalproject.vo.Posibility;
import finalproject.vo.Risk;

@Controller
@SessionAttributes("mem")
@RequestMapping("/risk.do")
public class A06_RiskCtrl {
	@Autowired(required=false)
	private A06_RiskService service;
	
	// 1. 전체리스트 조회
	@RequestMapping(params="method=list")
	public String risk(Model d, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		
		String prjno = mem.getPrjno(); // 나중에 세션으로 받아올 것 
		System.out.println("프로젝트번호 : "+mem.getPrjno());
		System.out.println("멤버번호"+mem.getMemno());
		
		MemforRisk memAuth = service.memAuth(mem);

		d.addAttribute("riskList", service.riskList(prjno));
		d.addAttribute("riskdegree", service.degreeCount(prjno));
		d.addAttribute("posible", service.posibleCount(prjno));
		d.addAttribute("rgscount", service.rgsdteCount(prjno));
		d.addAttribute("status", service.statusCount(prjno));
		
		if(!prjno.equals("pro0")) {
			d.addAttribute("memAuth", memAuth.getAuth());
			System.out.println("프로젝트 있는경우");
		}
	
		
		return "WEB-INF\\view\\pms\\a01_main\\a06_risk.jsp";
	}

	// 2. 상세조회
	@RequestMapping(params="method=detail")
	public String riskDetail(@RequestParam("riskno") String riskno, Model d, HttpSession session) {	
		Member mem = (Member)session.getAttribute("mem");
		
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		String prjno = mem.getPrjno(); // 나중에 세션으로 받아올 것 
		//System.out.println("리스크 : "+prjno);
		MemforRisk memAuth = service.memAuth(mem);
		d.addAttribute("memAuth", memAuth.getAuth());
		
		System.out.println(memAuth.getAuth());
		d.addAttribute("taskList", service.taskList(prjno));
		d.addAttribute("mlist", service.mnameList(prjno));
		d.addAttribute("risk", service.riskDetail(riskno));
		return "WEB-INF\\view\\pms\\a01_main\\a06_2_riskDetail.jsp";
	}

	// 3. 추가
	@RequestMapping(params="method=addForm")
	public String riskAddform(@ModelAttribute("risk") Risk risk, Model d, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
				
		String prjno = mem.getPrjno(); // 나중에 세션으로 받아올 것 
		d.addAttribute("prjno", prjno);
		d.addAttribute("taskList", service.taskList(prjno));
		d.addAttribute("mlist", service.mnameList(prjno));
		return "WEB-INF\\view\\pms\\a01_main\\a06_1_riskAdd.jsp";
	}
	
	@RequestMapping(params="method=add")
	public String riskAdd(@ModelAttribute("risk") Risk risk) {
		//System.out.println("등록진입");
		service.riskInsert(risk);
		System.out.println("등록 메서드 실행");
		return "forward:/risk.do?method=list";
	}
	
	// 4. 업데이트
	@RequestMapping(params="method=update")
	public String riskUpdate(@ModelAttribute("risk") Risk risk, Model d) {
		service.riskUpdate(risk);
		System.out.println("업데이트");
		String riskno = risk.getRiskno();
		return "forward:/risk.do?method=detail&riskno="+riskno;
	}
	
	// 5.삭제
	@RequestMapping(params="method=delete")
	public String riskDelete(@RequestParam("riskno") String riskno) {
		service.riskDelete(riskno);
		System.out.println("삭제 실행");
		return "forward:/risk.do?method=list";
	}
}