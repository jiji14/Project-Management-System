	package finalproject.data.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public String actmembers(@ModelAttribute("msch") Members sch, HttpSession session, Model d) {
		Member mem = (Member)session.getAttribute("mem");
		String prjno = mem.getPrjno();
		//System.out.println("받은 세션 prjno : "+mem.getPrjno());
		if(mem.getId() == null) {
			return "WEB-INF\\view\\pms\\a01_main\\a00_login.jsp";
		}else {
			ArrayList<Members> actmem = service.actMemberList(prjno);
			System.out.println("활성화 멤버 size : "+actmem.size());
			d.addAttribute("actmemberList",actmem);
			
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
		String prjno = mem.getPrjno();
		
		// System.out.println("현재 선택된 prjno : "+mem.getPrjno());
		
		if(mem.getId() == id) {
			
			System.out.println("로그아웃 상태");
			return "WEB-INF\\view\\pms\\a01_main\\a00_login.jsp";
		}else {
			System.out.println("로그인 상태");
			ArrayList<Members> selectMem = service.selectMem(prjno);
			System.out.println("selectMem size : "+selectMem.size());
			
			String data = "no";
			
			ArrayList<Members> memnoList = service.memnoList();
			for(Members a : memnoList) {
				if(id.equals(a.getId())) {
					data = "ok";
				}
				
			}
			
			 for(Members a : selectMem) {
			 //System.out.println("----------------------------");
			 //System.out.println("memno : "+a.getMemno());
			 //System.out.println("id : "+a.getId());
			 //System.out.println("activation : "+a.getActivation());
			 if(id.equals(a.getId())) { 
				 System.out.println("중복"); data = "cancle"; 
				 } 
			 }
			 
			d.addAttribute("memIns",data);
			
			if(data.equals("ok")) {
				d.addAttribute("addMem",service.addMem(id));				
			}
			/*
			 * Members dsd = service.addMem(id); System.out.println(dsd.getId());
			 */
			d.addAttribute("isable", data);
			System.out.println("service 처리 후 Ctrl : "+data);
			
			return "pageJsonReport";
		}
	}
	
	//등록하는 친구
	//members.do?method=insert
	@RequestMapping(params="method=insert")
	public String insertMembers(Members ins, Model d , HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		//System.out.println("현재 선택된 prjno : "+mem.getPrjno());
		//System.out.println("권한: "+ins.getAuth());
		//System.out.println("회원번호: "+ins.getMemno());
		//System.out.println("프로젝트 번호: "+mem.getPrjno());
		ins.setPrjno(mem.getPrjno());
		//System.out.println("회원에 들어간 prjno : "+ins.getPrjno());
		//System.out.println("회원 id : "+ins.getId());
		System.out.println("아이디 확인:"+ins.getId());
		String ids = ins.getId();
		String data = "ok";
		System.out.println(ids);
		if(ids == null || ids.equals("")) {
			data = "no";
		}else {
			
			service.insertMembers(ins);
		}
		
		d.addAttribute("memIns",data);
		//System.out.println("service 처리 후 ctrl");
		return "pageJsonReport";
	}
	
	@RequestMapping(params = "method=delete")
	public String deleteMembers(@RequestParam("memno") String memno, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		String prjno = mem.getPrjno();
		
		Map<String, Object> map = new HashMap();
		map.put("memno", memno);
		map.put("prjno", prjno);
		
		System.out.println("삭제할 memno:"+memno);
		System.out.println("삭제할 prjno:"+prjno);
		service.deleteMembers(map);
		
		return "redirect:/members.do?method=list";
	}
	
	
	@RequestMapping(params = "method=actupdate")
	public String actupdate(@RequestParam("memno") String memno, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		String prjno = mem.getPrjno();
		
		Map<String, Object> map = new HashMap();
		map.put("memno", memno);
		map.put("prjno", prjno);

		System.out.println("수정할 멤버 번호 : "+memno);
		
		service.inactupdate(map);
		
		System.out.println("서비스 처리 했나?");
		
		return "redirect:/members.do?method=list";
	}
	
	@RequestMapping(params = "method=inactupdate")
	public String inactupdate(@RequestParam("memno") String memno, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		String prjno = mem.getPrjno();
		Map<String, Object> map = new HashMap();
		map.put("memno", memno);
		map.put("prjno", prjno);
		
		service.actupdate(map);
		
		return "redirect:/members.do?method=list";
	}
	
	@RequestMapping(params = "method=authupdate")
	public String authupdate(@RequestParam("memno") String memno,
							 @RequestParam("auth") String auth,
							 HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		String prjno = mem.getPrjno();
		Map<String, Object> map = new HashMap();
		map.put("memno", memno);
		map.put("prjno", prjno);
		map.put("auth", auth);
		
		System.out.println("prjno : "+prjno);
		System.out.println("memno : "+memno);
		System.out.println("auth : "+auth);
		service.authupdate(map);
		
		return "redirect:/members.do?method=list";
	}
	
}

