package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;


import finalproject.vo.Profile;

@Repository
public interface ProfileDao {

	public Profile profileList(Profile sch);
	
	public void updateProfile(Profile upt);
}
