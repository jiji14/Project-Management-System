package finalproject.data.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import finalproject.data.dao.A04_BoardDao;
import finalproject.vo.Board;
import finalproject.vo.BoardSch;

@Service
public class A04_BoardService {
   @Autowired(required=false)
   private A04_BoardDao dao;
   
   public ArrayList<Board> boardList(BoardSch sch){
      //1. 데이터 총 건수
      sch.setCount(dao.totCnt(sch));
      //2. 화면에 한번에 보여줄 데이터 건수
      if(sch.getPageSize()==0) {
         sch.setPageSize(5);
      }
      System.out.println("총 데이터 건수:"+sch.getCount());
      //3. 총 페이지 수
      System.out.println("총 페이지 수:"+(int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
      
      sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
      //4. 현재 클릭한 페이지 정보
      if(sch.getCurPage()==0) {
         //초기화면에서는 당연히 curpage 정보가 0이다.
         sch.setCurPage(1);
      }
      System.out.println("현재 클릭한 페이지 번호:"+sch.getCurPage());
      //현재 페이지 번호와 페이지당 보일 데이터 건수 5개
      //화면에 나타날 데이터 rownum(start,end) 기준으로 
      //    1   5   1 2 3 4 5         시작번호:1, 마지막번호:5
      //   2   5   6 7 8 9 10         시작번호:6, 마지막번호:10
      //   3   5   11 12 13 14 15      시작번호:11,마지막번호:15
      // 페이지 보여질 갯수  시작번호~마지막번호
      //마지막 번호를 뽑아내는 방법? sch.getCurPage()*sch.getCount()
      sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
      
      sch.setEnd(sch.getCurPage()*sch.getPageSize());
      System.out.println("시작 번호:"+sch.getStart());
      System.out.println("마지막 번호:"+sch.getEnd());
      //페이지 block 처리..
      /* 1) vo 속성 설정(화면호출필요): blockSize(한번에 보일 block의 크기)
       * 	startBlock : 시작 block 번호, endBlock 마지막 block 번호
       * 	block의 크기
       * 2) 블럭 시작번호와 마지막번호를 저장처리
       * 3) VIEW단에서 처리..
       *	previous [6][7][8][9][10] next
       * 	시작번호: 1,6,11 마지막번호 5,10,13
       * 	 1 2 3 4  5 ->  첫번째blocknum 1
       *  <- 6 7 8 9 10         blocknum 2
       *  <- 11 12 13			blocknum 3
       *  <--(previous) 가 나타날 조건- 시작블럭번호가 블럭의 크기보다 클때..
       *    -->(next)가 나타날 조건  - 마지막 블럭번호가 총페이지수보다 작을때 
       *  
       *  #속성값 설정..
       *  1. 초기 block size(한번에 보일 block 크기 설정)
       * */
      	sch.setBlockSize(5);
      	// 2. blocknum(블럭의 번호를 통해서 시작/마지막 번호를 가져오게 한다.) 바꿔도 귿~
      	//    블럭의 번호는 현재 페이지/블럭의 크기
      	//    1/5, 2/5, 3/5, 4/5, 5/5 ==> 1
      	//    1/5, 2/5, 3/5, 4/5, 5/5 ==> 1
      	int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
      	//	마지막번호는 블럭의번호(여기선 1or2or3)*블럭의 크기(5)
      	//  단 마지먹블럭을 보면 13까지밖에 없으니 전체페이지크기보다는 작아야 한다. logic 따로.
      	int endBlock = blocknum*sch.getBlockSize();
      	// 마지막 블럭번호의 예외로 전체페이지수보다 클때 페이지 카운트를 하겠다. 
      	// 15가 13보다 클때 pagecount를 해서 넣어주겠다.
      	sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
      	sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
      	System.out.println("시작 block번호:"+sch.getStartBlock());
      	System.out.println("마지막 block번호:"+sch.getEndBlock());
      	
      	return dao.boardList(sch);
   }
   
   
   
   
   
   
   
   public void boardInsert(Board insert) {
      //기본 정보 등록 처리
      dao.boardInsert(insert);
      //파일 관련 등록 처리
      upLoad(insert);
   }

   /*
   1.공통 정보에서 파일 업로드 경로 설정된 내용 가져오기 (property info에 설정되어 있다)
   2.파일 업로드 모듈 처리하기
   3.파일 업로드 정보 DB에 등록 하기 
   
   
   */
   
   @Value("${upload}")
   private String upload;
   @Value("${tmpupload}")
   private String tmpupload;
   //설정된 내용이 해당하는 변수명으로 할당된다. tmpupload는 개발용으로 임시 파일 저장만 가능하기에 개발에서는 사용하지 않는다.
   //info file의 공백(스페이스바)는 절대 있어서는 안된다.
   
   
   
   
   private void upLoad(Board insert) {
      //1.파일 업로드 처리
      System.out.println("경로1:"+upload);
      System.out.println("경로2:"+tmpupload);
      for(MultipartFile report: insert.getReport()) {
         System.out.println("파일명:"+report.getOriginalFilename());
         //1)파일이름 가져오기
         String fname = report.getOriginalFilename();
         
         
         
         //2)파일 객체 생성과 할당
         File tmpFile = new File(tmpupload+fname);
         File file = new File(upload+fname);
         //3)요청 객체로 넘어온 객체에 임시 파일 객체로 할당
         try {
            if(fname!=null&&!fname.trim().equals("")) {
               //파일 첨부가 3개 있을 시, 1개의 파일만 받고 나머지는 공백일 경우를 대비하여 try-catch문을 작성해준다.
               //화면에서 등록하지 않은 파일은 제외 - 파일은 null 값이 아니고 공백이 아닌 경우만 해당
               //받은 Multipartfile 객체를 실제 저장할 파일 객체로 변환
               report.transferTo(tmpFile);
               //4) 임시 위치에서 웹서버의 구조로 복사 처리
               Files.copy(tmpFile.toPath(), file.toPath());
            }
            
         } catch (IllegalStateException e) {
            e.printStackTrace();
            System.out.println("오류스"+e.getMessage());
         } catch (IOException e) {
            e.printStackTrace();
            System.out.println("오류스2"+e.getMessage());
         } 
         //2.DB 처리
         
         if(fname!=null&&!fname.trim().equals("")) dao.insertBoardFile(fname);
         //dao 저장을 위한 dao.insertBoardFile
      }
      
   }
   
   
   //상세화면 조회
   //1. 조회수 countup dao
   //2. 조회 내용 단일 데이터 dao
   
   public Board getBoard(int no) {
         dao.uptReadCnt(no);
         
         Board one = dao.getBoard(no);   // 기본정보, 파일도 함께 가져올 수 있게
         one.setFnames(dao.getFiles(no)); // 파일정보를 조회해서 가져온다.
         System.out.println("파일의 갯수:"+one.getFnames().size());
         
         return one;
      }
   //수정 처리시
   //1.수정 처리
   //2.수정 후, 단일 데이터 조회
   public Board updateBoard(Board update) {
      dao.updateBoard(update);
      return dao.getBoard(update.getNo());
   }

   //삭제 처리
   public void deleteBoard(int no) {
      dao.deleteBoard(no);
   }


}
