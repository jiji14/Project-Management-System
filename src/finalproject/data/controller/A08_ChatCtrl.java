package finalproject.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat.do")
public class A08_ChatCtrl {

	@RequestMapping(params="method=list")
	   public String list() {
	      return "WEB-INF\\view\\pms\\a01_main\\chatpage.jsp";
	   }
	
}
