package test;

import java.sql.SQLException;

import dao.DirectorDao;
import entity.Director;

public class TestDirector {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		Director d = new Director();
		DirectorDao dd = new DirectorDao();
		
		//test add director
		/*d.setDirectorid(14);
		d.setDirectorname("黄渤");
		if(dd.addDirector(d) == true){
			System.out.println("add director successful!");
		}
		else System.out.println("add director successsful!");*/
		
		//test delete director
		/*d.setDirectorid(14);
		if(dd.deleteDirector(d) == true){
			System.out.println("delete director successful!");
		}
		else System.out.println("delete director successsful!");*/
	
	}
}
