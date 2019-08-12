package finalproject.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import finalproject.data.service.ProfileService;
import finalproject.vo.Member;
import finalproject.vo.Profile;

@Controller
@RequestMapping("/profile.do")
public class C01_ProfileCtrl {
	@Autowired(required=false)
	private ProfileService service;
	
	@RequestMapping(params="method=profile")
	public String profileList(Profile sch, Model d) {
		d.addAttribute("profileList",service.profileList(sch));
		return "WEB-INF\\view\\pms\\a01_main\\c01_profile.jsp";
	}
	
	
	@RequestMapping(params="method=update")
	public String profileUpdate(Profile upt) {
		System.out.println("수정된이름:"+upt.getName());
		
		service.updateProfile(upt);
		return "forward:/profile.do?method=profile";
	}
	
}
