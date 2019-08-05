package finalproject.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import finalproject.data.service.A03_MemberService;
import finalproject.vo.Member; 

/*
 * #Spring에서 session을 설정하려면
 * 1. controller단위로 session을 설정할 수 있게 모듈을 지원하고 있다.
 * 2. 형식.. 
 * 		1) controller 선언 부분 SessionAttribute("모델")로 
 * 		  annotation 설정.
 * 		2) 공통 메서드로 해당 객체를 session 객체로 처리할 객체를 모델이름으로
 * 		  return하게 처리. 
 * 	
 * */


@Controller
@RequestMapping("/member.do")
public class A03_MemberCtrl {
	
	@ModelAttribute("mem") //다른 페이지 이동해도 정보 가지고 있는
	public Member getMember() {
		return new Member();
	}
	
	@Autowired(required=false)
	private A03_MemberService service;
	
	@RequestMapping(params="method=loginForm")
	public String loginForm() {
		return "WEB-INF\\view\\pms\\a01_main\\a00_login.jsp";
	}
	
	// modelAttribute:
	//1. 요청처리 객체 + model
	//modelAttribute 처리가 되면, controller 단위로 session값을 설정하여 처리할 수 있다.. 
	// SessionAttributes 객체 활용한다.
	
	
	@RequestMapping(params="method=login")
	public String login(@ModelAttribute("mem") Member mem, HttpSession session, Model d) {
		// model 객체와 요청값을 둘다 처리해주는게 ModelAttribute
		
		String page = "redirect:/dashboard.do?method=list";
		
		Member m=null; 
		
		if(mem.getId()!=null) { //mem의 여러 정보중 id를 가져오거나 pw를 가져오고있다.
			// DB 처리를 통해서 데이터를 확인.
			System.out.println("id:"+mem.getId());
			System.out.println("pw:"+mem.getPw());
			
			//mem 여러 정보들이 담긴 객체를  session 처리.
			m= service.login(mem);
			//System.out.println("m:"+m.getId());
			session.setAttribute("mem",m);
			System.out.println("mem(세션):"+mem.getId());
		}
		
		System.out.println(m!=null?"로그인 성공":"로그인 실패");  //:=아니면
		//위에 만든 m이 null이면 로그인 실패, 다시 로그인페이지로.
		if(m==null) {
			d.addAttribute("checklogin", "loginfail");  //확인받은 m이 없으면 loginfail att 저장. view단에서 javascript로 alert에 쓰임.
			page =  "WEB-INF\\view\\pms\\a01_main\\a00_login.jsp";
		}
		/*	◎ Model addAttribute(String name, Object value)
			value객체를 name이름으로 추가한다, 뷰 코드에서는 name으로 지정한 이름을 통해서 value를 사용한다.
			
			◎ Model addAttribute(Object value)
			value 를 추가한다,. value의 패키지 이름을 제외한 단순 클래스 이름을 모델이름으로 사용한다. 이 때 첫 글짜는 소문자로 처리한다.
			value가 배열이거나 콜렉션인 경우 첫 번째 원소의 클래스 이름뒤에 "List"를 붙인 걸 모델 이름으로 사용한다. 이 경우에도 클래스 이름의 첫자는 소문자로 처리한다.
			
			 ◎ Model addAllAttributes(Collection<?> values)
			addAttribute(Object value)메서드를 이용해서 콜랙션에 포함된 객체들을 차례대로 추가한다.
			[출처] model.addAttribute 관련|작성자 시아
			
		 * */
			
		
		return page;
	}
	
	@RequestMapping(params="method=logout")
	public String login(HttpSession session) {
		
		// 세션종료
		session.invalidate();
		System.out.println("세션종료");

		return "redirect:/member.do?method=loginForm";
	}
	
	
	
}
