package test;

import java.sql.SQLException;

import dao.PictureDao;
import entity.Picture;

public class TestPicture {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		Picture p = new Picture();
		PictureDao pd = new PictureDao();
		
		//test add picture
		/*p.setPicid(15);
		p.setPiclocation("d:\\database\\img\\15.jpg");
		if(pd.addPicture(p) == true){
			System.out.println("add picture successful!");
		}
		else System.out.println("add picture failed!");*/
		
		//test delete picture
		/*p.setPicid(15);
		if(pd.deletePicture(p) == true){
			System.out.println("delete picture successful!");
		}
		else System.out.println("delete picture failed!");*/
		
	}

}
