package finalproject.data.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import finalproject.data.service.A07_TodoService;
import finalproject.vo.Member;
import finalproject.vo.ToDoList;


@Controller
@SessionAttributes("mem")
@RequestMapping("/todolist.do")
public class A07_ToDoCtrl {
	
	@Autowired(required=false)
	private A07_TodoService service;
	
	// 1. 전체리스트 조회
	@RequestMapping(params="method=list")
	public String todolist(Model d, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		
		int listCnt = (service.todoList(mem)).size()+(service.hiddenList(mem).size());
		int emerCnt = (service.todoEmer(mem).size()+service.hiddenEmer(mem).size());
		int doneCnt = (service.todoDone(mem).size()+service.hiddenDone(mem).size());
		System.out.println(listCnt+emerCnt+doneCnt);
		int[] cnt = new int[] {listCnt, emerCnt, doneCnt};
		d.addAttribute("cnt", cnt);
		d.addAttribute("todolist", service.todoList(mem));
		d.addAttribute("todoemer", service.todoEmer(mem));
		d.addAttribute("tododone", service.todoDone(mem));
		return "WEB-INF\\view\\pms\\a01_main\\a07_todolist.jsp";
	}
	
	@RequestMapping(params="method=addWorkcard")
	public String addWorkcard(@RequestParam("step") String step, Model d, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		System.out.println("step:"+step);
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		System.out.println(step);
		if(step.equals("progress")) {
			d.addAttribute("todolist", service.hiddenList(mem));	
			System.out.println("progress 보냈다!");
		}else if(step.equals("emergency")) {
			d.addAttribute("todolist", service.hiddenEmer(mem));
			System.out.println("emergency 보냈다!");
		}else if(step.equals("done")) {
			d.addAttribute("todolist", service.hiddenDone(mem));
			System.out.println("done 보냈다!");
		}
		return "pageJsonReport";
	}
	
	@RequestMapping(params="method=hide")
	public String makeHide(@RequestParam("taskid") String taskid, Model d, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		System.out.println("테스크아이디: "+taskid);
		service.makeHidden(taskid);
		return "redirect:/todolist.do?method=list";
	}
	
	@RequestMapping(params="method=show")
	public String makeShow(@RequestParam("taskid") String taskid, Model d, HttpSession session) {
		System.out.println("컨트롤러");
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		System.out.println("테스크아이디: "+taskid);
		service.makeShow(taskid);
		return "WEB-INF\\view\\pms\\a01_main\\a08_addWorkcard.jsp";
	}
	
	@RequestMapping(params="method=detail")
	public String detail(@RequestParam("taskid") String taskid, Model d, HttpSession session) {
		Member mem = (Member)session.getAttribute("mem");
		// 로그인 정보를 못 받아올경우
		if(mem==null) {
			return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
		}
		System.out.println("테스크아이디: "+taskid);
		d.addAttribute("detail", service.detail(taskid));
		return "pageJsonReport";
	}
}
