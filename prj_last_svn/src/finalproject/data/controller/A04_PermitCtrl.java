package finalproject.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/permit.do")
public class A04_PermitCtrl {
	@RequestMapping(params="method=member")
	public String call() {
		return "WEB-INF\\view\\pms\\a01_main\\a04_permit.jsp";
	}
	@RequestMapping(params="method=manager")
	public String call2() {
		return "WEB-INF\\view\\pms\\a01_main\\a04_manager.jsp";
	}
	
}
