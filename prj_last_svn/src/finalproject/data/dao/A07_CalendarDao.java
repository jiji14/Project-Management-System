package finalproject.data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import finalproject.vo.Calendar;

@Repository
public interface A07_CalendarDao {

	public ArrayList<Calendar> calList();
	
	public void insert(Calendar ins);
	
	public void update(Calendar update);
	
	public void delete(int id);

}
