package finalproject.data.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import finalproject.vo.Member; 

@Repository
public interface A03_MemberDao {
	
	public Member login(Member sch);
	

	
}



