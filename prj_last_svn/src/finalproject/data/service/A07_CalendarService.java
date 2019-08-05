package finalproject.data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import finalproject.data.dao.A07_CalendarDao;
import finalproject.vo.Calendar;

@Service
public class A07_CalendarService {
   @Autowired(required=false)
   private A07_CalendarDao dao;
   
   public ArrayList<Calendar> calList(){
      return dao.calList();
   }
   
   public void insert(Calendar ins) {
	   dao.insert(ins);
   }
   
   public void update(Calendar update) {
	   dao.update(update);
   }
   
   public void delete(int id) {
	   dao.delete(id);
   }
   
}