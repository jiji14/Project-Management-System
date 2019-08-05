package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Board;
import finalproject.vo.BoardSch;

@Repository
public interface A04_BoardDao {
	   
	   //dao, 기본 vo 등록, BoardMapper.xml 
	   //select * from board 설정
	   //public ArrayList<Board> boardList(BoardSch sch)
	   public ArrayList<Board> boardList(BoardSch sch);
	   
	   //총 건수를 가져오기
	   
	   public int totCnt(BoardSch sch);
	   
	   
	   
	   
	   //등록처리
	   public void boardInsert(Board insert);
	   
	   //첨부파일 생성
	   public void insertBoardFile(String fname);
	   
	   //조회시마다,조회 카운트 업
	   public void uptReadCnt(int no);
	   
	   //파일 가져오기
	   public ArrayList<String> getFiles(int no);
	   
	   
	   public Board getBoard(int no);
	   
	   /*
	   update board 
	      set title = @@,
	         readcnt = readcnt+1,
	         writer = @@,
	         uptdte = sysdate,
	         content = @@,
	      where no = ###
	         
	   */
	   
	   //수정처리
	   public void updateBoard(Board update);
	   
	   //삭제처리
	   public void  deleteBoard(int no);
	   
	  
	   
	   
	   
	}