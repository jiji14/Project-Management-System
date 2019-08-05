package finalproject.data.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import finalproject.data.service.A04_JoinService;
import finalproject.vo.Member;

@Controller
@RequestMapping("/join.do")
public class A04_JoinCtrl {
   @Autowired(required=false)
   private A04_JoinService service;
   
   @RequestMapping(params="method=insertForm")
   public String form() {
      return "WEB-INF\\view\\pms\\a01_main\\a01_signup.jsp";
   }
   @RequestMapping(params="method=insert")
   public String join( Member insert) {
	  System.out.println("들어가나요?");
	  System.out.println("id:"+insert.getId());
      if(insert.getId()!=null) {
      System.out.println("이름:"+insert.getName());
      service.joinMem(insert);
      
      }
      return "WEB-INF\\view\\pms\\a01_main\\a00_login.jsp";
      
   }

	@ResponseBody
	@RequestMapping(params="method=emailcheck") //이메일 중복검사
	public String postIdCheck(@RequestParam("email") String id) throws Exception {
		String ret;
		Member member = new Member();
		member.setId(id);
		//System.out.println("ajax:"+id);
		//String ok = "yookay";
		//System.out.println("값 넘겨줌");
		Member mem = service.idCheck(id);	
		if(mem!= null) {
			ret= "no";
		} else {
			ret= "yes";
		}

		return ret;
	}
	
   
   
}