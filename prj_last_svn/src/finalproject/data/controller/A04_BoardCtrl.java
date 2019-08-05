package finalproject.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import finalproject.data.service.A04_BoardService;
import finalproject.vo.Board;
import finalproject.vo.BoardSch;

@Controller
//controller의 공통적인 url mapping 주소 선언
// http://localhost:7080/spring/board.do
// 실무에서는 info 대신에 통체 서버를 만든다. 이게 eclipse 소규모 개인 프로젝트여서 파일서버 위치를 info처럼 넣는거다.
// info에서는 db_id=scott  절대 뒤에 공백 space 넣으면 안된다.

@RequestMapping("/board.do")
public class A04_BoardCtrl {
   @Autowired(required=false)
   private A04_BoardService service;
   
   // board.do?method=list
   @RequestMapping(params = "method=list")
   public String list(@ModelAttribute("bsch") BoardSch sch, Model d) {
      //BoardSch : 요청값 처리 및 검색데이터 조회화면에 출력(model+요청)
      //Model : 화면에 list할 데이터 처리를 위한 model 선언
      System.out.println(sch.getTitle());
      System.out.println(sch.getWriter());
      d.addAttribute("boardList", service.boardList(sch));
      return "WEB-INF\\view\\pms\\a01_main\\c01_boardList.jsp";
   }
   //method=list
   // 1.초기 등록하는 양식화면j
   // 2. 등록된 양식에 데이터를 입력해서 전송을 통해서 데이터 등록 처리.. (process) 
   // 3. 답글 등록 양식/답글처리 프로세스
   
   
   // board.do?method=insert
   // 위에 공통적인 url주소와 연결하여 기능적으로 추가하는 url 주소를 선언하여 사용할 수 있다.
   // http://localhost:7080/spring/board.do?method=list
   // http://localhost:7080/spring/board.do?method=insert
   // ModelAttribute("bsch") : 화면(view)에 보낼 객체(BoardSch-bsch)와 요청값을 처리할
   // 객체 (BoardSch)  
   
   @RequestMapping(params = "method=insert")
   public String insert(@ModelAttribute("board") Board ins) {
      System.out.println("답글번호:"+ins.getRefno());
      
      //DB입력 처리시
      //데이터를 입력시 처리..: 원래 답글에는 no가 있기 때문에 구분처리..
      //ins.getNo()==0는 답글 형식을 호출하는 처리가 아님을 나타낸다.
      //1. 초기 등록 양식에서 글등록을 클릭했거나
      //2. 답글 양식에서 답글을 등록(전송)을 했을 때 처리.
      if(ins.getNo()==0 && ins.getTitle()!=null) {
			service.boardInsert(ins);
		}
		return "WEB-INF\\view\\pms\\a01_main\\a05_boardinsert.jsp";
   }
   
   //view단에서 요청된 uri형식 : board.do?method=detail&no=1
   //board.do?method=detail&no=1 해당 경로에 int 형 no를 받아 처리하겠다. 
   @RequestMapping(params = "method=detail")
   public String detail(@RequestParam("no") int no, Model d) {
      //상세화면에서 모델 데이터를 넘겨주기
      System.out.println("상세화면 no:"+no);
      //Board detail = service.getBoard(no);
      //System.out.println("DB에서 온 데이터:"+detail.getTitle());
      //System.out.println("DB에서 온 데이터:"+detail.getWriter());
      d.addAttribute("board",service.getBoard(no));
      
      
      //다시 controller list 호출
      return "WEB-INF\\view\\pms\\a01_main\\c03_boardDetail.jsp";
   }
   
   @RequestMapping(params ="method=update")
   public String update(Board update, Model d) {
      System.out.println("no:"+update.getNo());
      System.out.println("title:"+update.getTitle());
      d.addAttribute("board",service.updateBoard(update));
      return "WEB-INF\\view\\pms\\a01_main\\c03_boardDetail.jsp";
   }
   
   @RequestMapping(params = "method=delete")
   public String delete(@RequestParam("no") int no) {
	   System.out.println("삭제할 번호:"+no);
	   service.deleteBoard(no);
	   
	   //return "forward:/board.do?method=detail";
	   // 삭제 후에는 조회 list로 이동
	   return "redirect:/board.do?method=list";
   }
   
   //상세화면에서 첨부 파일을 클릭시, 파일명을 전송하여 해당 메서드를 통해서 
   // 파일이 다운로드 되게 처리하세요. downloadviewer 사용.
   @RequestMapping(params = "method=download")
   public String download(@RequestParam("fname") String fname, Model d) {
	   d.addAttribute("downloadFile", fname);
	   
	   return "downloadViewer";
   }
   
   
   /*
   #게시판 개발
   0. 주요 기능
      1) 무한 레벨 답변형 게시판(계층형)
      2) 파일 업로드(자료 첨부 처리)
      3) 엑셀 및 pdf 다운로드 처리
      4) 글등록/수정/삭제/답변글 등록 
      5) 페이징 처리
   1. database 설계
      1) 사용하게 될 list 정리 - 컬럼
         테이블 작성, sequence 작성
      2) 사용하게 될 SQL 정리 
         -기본 테이블 : 조회문, 등록, 수정, 삭제 
         -답변형 처리 조회문 작성(계층형 sql)
         
   2. 기본 VO와 DAO 작성
      
   3. 1차 기본 list service, controller 구현
      dao -> service -> controller 
   4. 1차 view 단 (테이블 list)
      model 설정, 조회하면 list 
   5. 등록 처리
      1) 화면처리
      2) 파일 업로드
   6. 게시글 상세화면 처리
      1) 수정, 삭제
      2) 답글달기 처리
   7. 메인 화면에서 계층형 sql로 리스트 처리
   8. paging 처리
   9. 엑셀 및 pdf 다운로드 처리 
   
   #계층형 게시판 처리
   1. 답글을 원글의 하위에 설정함으로 계층형으로 답변이 처리된 내용을 list하게 한다.
   2. 개발 순서..
   		1) 답글에 대한 계층으로 보이게 하기 위하여 제목글 왼쪽 정렬 처리..
   		2) 계층형 sql작성..
   			상위 글과 하위글을 매핑하는 oracle의 sql문 작성..
   	
   #페이지 처리..
   1. 게시물에 대한 전체 데이터를 로딩하는 것을 화면에 대한 부하와 검색물을 찾는 것도 어려워지게 한다.
   2. 한 화면에 보일 건수를 지정하고, 해당 건수에 따른 페이징 처리함으로써 게시물에 대한 효과적인 검색과 부하를 
   	줄일 수 있다.
   3. 페이지 처리
   		1) sql에서 page별로 보일 데이터를 검색시, 처리하는 것을 말한다.
   			-1page에서는 글 번호 1~10
   			-2page에서는 글 번호 11~20
   		2) 위 내용과 같이 해당 페이지에서 보여줄 시작번호(11), 마지막번호(20)을 지정하여 처리한다
   
   -- 5개씩 보여주는 데이터 처리 페이지에서 두번쨰 페이지
-- 1. 페이징 처리는 해당 페이지의 시작번호와 마지막 번호를 입력받아 처리되어야 한다.
-- 2. 페이지 번호와 한번에 보여줄 데이터 건수를  통해서 페이지의 시작번호와 마지막번호가 나온다. 몇개씩 보여줄것인가와 시작번호/마지막번호를 기준으로 몇페이지로 잘라서 나오는게 핵심.
-- 3. 하단에 화면 인터페이스 정의
--		[1][2][3][4]
-- 4. 마지막 번호는 데이터 총건수와 한페이지에 보여줄 데이터 건수를 통해서 나올 수 있다. 
--    ex) 총데이터 건수가 17, 한번에 보여줄 페이지수 5이면 총 페이지 수는? 4  CEIL(17/5)
--    ex) 총데이터 건수가 20, 한번에 보여줄 페이지수 5이면 총 페이지 수는? 4  CEIL(20/5)
--    ex) 총데이터 건수가 15, 한번에 보여줄 페이지수 5이면 총 페이지 수는? 3  CEIL(15/5)

-- # 페이지 처리 개발 순서
--1. 총건수를 데이터 로딩 처리.
		화면에서 보여줄 modelattribute(요청+화면에 처리할 데이터)를 통해서 변수를 저장 처리하여야 한다.
--2. 지정된 한페이지에서 보여줄 데이터건수를 설정하여, 화면에 보여 줄 페이지 LIST를 하단에 처리한다.
 		페이지수
--3. 리스트에서 클릭했을 때, 로직에 의해 시작번호와 마지막번호를 통해, 
--4. 해당 페이지에 로딩될 데이터를 처리한다.
   
   
   
   
   
   */
}