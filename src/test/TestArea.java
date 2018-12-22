package test;

import java.sql.SQLException;

import dao.AreaDao;
import entity.Area;

public class TestArea {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		Area a = new Area();
		AreaDao ad = new AreaDao();
		
		//test add area
		/*a.setAreaid(10);
		a.setAreaname("泰国");
		if(ad.addArea(a) == true){
			System.out.println("add area successful!");
		}
		else System.out.println("add area successful!");*/
		
		//test delete area
		/*a.setAreaid(10);
		if(ad.deleteArea(a) == true){
			System.out.println("delete area successful!");
		}
		else System.out.println("delete area successful!");*/
	}

}
