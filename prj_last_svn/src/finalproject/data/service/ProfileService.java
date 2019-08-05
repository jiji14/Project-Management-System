package finalproject.data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.ProfileDao;
import finalproject.vo.Member;
import finalproject.vo.Profile;


@Service
public class ProfileService {

	@Autowired(required=false)
	private ProfileDao dao;
	
	public Profile profileList(Profile sch){
		return dao.profileList(sch);
	}
	
	public void updateProfile(Profile upt) {
		dao.updateProfile(upt);
	}
}
