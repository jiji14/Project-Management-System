package finalproject.data.dao;



import org.springframework.stereotype.Repository;

import  finalproject.vo.Member;

@Repository
public interface A04_JoinDao {
   
   // 2. 입력 메서드
   public void joinMem(Member insert);
   
   public Member idCheck(String id) throws Exception;
   
   /* UI 기본세팅 */
   public void insertUi();
}