package finalproject.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Z01_Error {
	@RequestMapping("/error.do")
	public String error() {
		return "WEB-INF\\view\\pms\\a01_main\\z01_error.jsp";
	}

}



