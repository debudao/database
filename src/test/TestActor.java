package test;

import java.sql.SQLException;

import dao.ActorDao;
import entity.Actor;

public class TestActor {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		Actor a = new Actor();
		ActorDao ad = new ActorDao();
		
		//test add actor
		/*a.setAid(12);
		a.setAname("王传君");
		a.setAsex("男");
		a.setaBirthday("1989-01-12");
		if(ad.addActor(a) == true){
			System.out.println("add actor successful！");
		}
		else System.out.println("add actor failed！");*/
		
		//test delete actor
		/*a.setAid(12);
		if(ad.deleteActor(a) == true){
			System.out.println("delete actor successful！");
		}
		else System.out.println("delete actor failed！");*/
		
	}

}
