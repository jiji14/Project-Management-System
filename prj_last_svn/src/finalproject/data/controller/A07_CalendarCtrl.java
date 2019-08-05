package finalproject.data.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import finalproject.data.service.A07_CalendarService;
import finalproject.vo.Calendar;
import finalproject.vo.Person;

@Controller
@RequestMapping("/calendar.do")
public class A07_CalendarCtrl {
   @Autowired(required=false)
   private A07_CalendarService service;
   
   
   // 초기 화면 호출
   // /calendar.do?method=list
   @RequestMapping(params="method=list")
   public String list() {
      return "WEB-INF\\view\\pms\\a01_main\\d01_fullcalendar.jsp";
   }
   // calendar.do?method=data
   // 요청값 name=himan&age=25
   @RequestMapping(params="method=data")
   public String data(@RequestParam("name") String name,
                  @RequestParam("age") int age ) {
      System.out.println("client에 의해서 호출되었습니다!!");
      System.out.println("이름:"+name);
      System.out.println("나이:"+age);
      
      return "";
   }

   
   
   @RequestMapping(params="method=data2")
   @ResponseBody
   public String data2(Person p) {
      System.out.println("client에 의해서 호출2되었습니다!!");
      System.out.println("이름:"+p.getName());
      System.out.println("나이:"+p.getAge());
      System.out.println("사는곳:"+p.getLoc());
      //  {"name":"himan","age":25,"loc":"seoul"}
      return "{\"name\":\"himan\",\"age\":25,\"loc\":\"seoul\"}";
   }   
   /*
    [{"title": "Confer(make)","start": "2019-07-16","end": "2019-07-17"}] 
    {"title": "work shop","start": "2019-07-19","end": "2019-07-20"}
    */      
   @RequestMapping(params="method=data3")
   @ResponseBody
   public String data3() {
      return "[{\"title\": \"Confer(make)\",\"start\": \"2019-07-16\",\"end\": \"2019-07-17\"},{\"title\": \"work shop\",\"start\": \"2019-07-19\",\"end\": \"2019-07-20\"}]";
   }
   // pageJsonReport
   @RequestMapping(params="method=data4")
   public String data4(Model d) {
      // vo객체 생성, model로 전달 처리..
      // String title, String start, String end, String color, String textColor)
      ArrayList<Calendar> list = new ArrayList<Calendar>();   
      list.add(new Calendar("회의","2019-07-16","2019-07-17","yellow","blue"));
      list.add(new Calendar("워크샵","2019-07-18","2019-07-20","blue","yellow"));
      
      d.addAttribute("list", list);
      
      
      return "pageJsonReport";
   }
   //service
   @RequestMapping(params="method=data5")
   public String data5(Model d) {
      
      d.addAttribute("list", service.calList());
      return "pageJsonReport";
   }
   
   @RequestMapping(params="method=insert")
   public String insert(Calendar insert) {
      System.out.println("등록한 제목:"+insert.getTitle());
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