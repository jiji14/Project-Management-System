package finalproject.data.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import finalproject.data.service.A07_CalendarService;
import finalproject.vo.Calendar;
import finalproject.vo.Member;

@Controller
@RequestMapping("/calendar.do")
public class A07_CalendarCtrl {
   @Autowired(required=false)
   private A07_CalendarService service;
   
   
   // 초기 화면 호출
   // /calendar.do?method=list
   @RequestMapping(params="method=list")
   public String list(Calendar list, HttpSession session, Model d) {
		  Member mem = (Member)session.getAttribute("mem");
		  String prjno = mem.getPrjno();
		  System.out.println("재설정한 prjno:"+list.getPrjno());
		  d.addAttribute("calList", service.calList(prjno));
	   return "WEB-INF\\view\\pms\\a01_main\\d01_fullcalendar.jsp";
   }

   //service
   @RequestMapping(params="method=data5")
   public String data5(HttpSession session, Model d) {
	   Member mem = (Member)session.getAttribute("mem");
		  String prjno = mem.getPrjno();
      d.addAttribute("list", service.calList(prjno));
      return "pageJsonReport";
   }
   
   @RequestMapping(params="method=insert")
   public String insert(@ModelAttribute("calendar")Calendar insert,HttpSession session, Model d) {
      System.out.println("등록한 제목:"+insert.getTitle());
      Member mem = (Member)session.getAttribute("mem");
	  String prjno = mem.getPrjno();
	  insert.setPrjno(prjno);
	  System.out.println("재설정한 prjno:"+insert.getPrjno());
      
      service.insert(insert);
      return "pageJsonReport";
   }
   
   @RequestMapping(params="method=update")
   public String update(Calendar update) {
      System.out.println("업데이트할 id:"+update.getId());
      service.update(update);
      return "pageJsonReport";
   }
   
   @RequestMapping(params="method=delete")
   public String delete(@RequestParam("id") int id) {
      System.out.println("삭제할 id:"+id);
      service.delete(id);
      return "redirect:/calendar.do?method=list";
   }
}