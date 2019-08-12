package finalproject.data.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import  finalproject.data.dao.A04_JoinDao;
import  finalproject.vo.Member;

@Service
public class A04_JoinService {

   @Autowired(required=false)
   private A04_JoinDao dao;
   
   
   public void joinMem(Member insert) {
      dao.joinMem(insert);
      dao.insertUi();
   }
   
	public Member idCheck(String id) throws Exception{
		return dao.idCheck(id);
	}
   
   
}