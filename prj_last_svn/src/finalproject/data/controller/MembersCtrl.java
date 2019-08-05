	package finalproject.data.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import finalproject.data.service.MembersService;
import finalproject.vo.Member;
import finalproject.vo.Members;

@Controller
@SessionAttributes("mem")
@RequestMapping("/members.do")
public class MembersCtrl {
	@Autowired(required=false)
	private MembersService service;
	
	//members.do?method=list
	@RequestMapping(params="method=list")
	public String actmembers(@ModelAttribute("msch") Members sch,HttpSession session, Model d) {
		Member mem = (Member)session.getAttribute("mem");
		String prjno = mem.getPrjno();
		System.out.println("받은 세션 prjno : "+mem.getPrjno());
		if(mem.getId() == null) {
			return "로그인페이지";
		}else {
			ArrayList<Members> actmem = service.actMemberList(prjno);
			d.addAttribute("actmemberList",actmem);
			System.out.println("활성화 멤버 size : "+actmem.size());
			
			ArrayList<Members> inactmem = service.inactMemberList(prjno);
			d.addAttribute("inactmemberList",inactmem);
			System.out.println("비활성화 멤버 size : "+inactmem.size());
			
			return "WEB-INF\\view\\pms\\a01_main\\a03_member.jsp";
		}
		
	}
	
	//검색 시 값을 가져오는 친구 
	//멤버 추가화면 Ctrl
	@RequestMapping(params="method=Addmem")
	public String addMemList(@RequestParam("id") String id, Model d,HttpSession session) {
		
		System.out.println("JSP에서 넘어온 id : "+id);
		
		Member mem = (Member)session.getAttribute("mem");
		
		System.out.println("현재 선택된 prjno : "+mem.getPrjno());
		
		if(mem.getId() == id) {
			
			System.out.println("로그아웃 상태");
			return "WEB-INF\\view\\pms\\a01_main\\a00_login.jsp";
		}else {
			
			System.out.println("로그인 상태");
			d.addAttribute("addMem",service.addMem(id));
			System.out.println("모델에 담겼나요?");
			
			return "pageJsonReport";
		}
	}
	
	//등록하는 친구
	//members.do?method=insert
	@RequestMapping(params="method=insert")
	public String insertMembers(Members ins, Model d , HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		System.out.println("현재 선택된 prjno : "+mem.getPrjno());
		System.out.println("권한: "+ins.getAuth());
		System.out.println("회원번호: "+ins.getMemno());
		System.out.println("프로젝트 번호: "+mem.getPrjno());
		ins.setPrjno(mem.getPrjno());
		System.out.println("회원에 들어간 prjno : "+ins.getPrjno());
		service.insertMembers(ins);
		String prjno = mem.getPrjno();
		String memno = mem.getMemno();
		ArrayList<Members> actmem = service.actMemberList(prjno);
		for(Members a : actmem) {
	         if(ins.equals(a.getId())) {
	            System.out.println(a.getId());
	            memno = a.getMemno();
	            System.out.println("중복");
	            System.out.println(a.getMemno());
	            d.addAttribute("memno",memno);
	         }else {
	            System.out.println("사용가능");
	         }
	      }
		
		System.out.println("service 처리 후 ctrl");
		d.addAttribute("memIns","ok");
		return "pageJsonReport";
	}
	
	
	@RequestMapping(params = "method=delete")
	public String deleteMembers(@RequestParam("memno") int memno) {
		System.out.println("삭제할 memno:"+memno);
		service.deleteMembers(memno);
		
		return "redirect:/members.do?method=list";
	}
}




