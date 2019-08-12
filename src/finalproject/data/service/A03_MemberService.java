package finalproject.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.A03_MemberDao;
import finalproject.vo.Member; 

@Service
public class A03_MemberService {

	@Autowired(required=false)
	private A03_MemberDao dao;
		
		public Member login(Member sch) {
		return dao.login(sch);
		}
		
	public String getAuth(Member m) {
	     return dao.getAuth(m);
	  };
		
	}
	
	
	

