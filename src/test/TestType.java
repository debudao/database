package test;

import java.sql.SQLException;

import dao.TypeDao;
import entity.Type;

public class TestType {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub

		Type t = new Type();
		TypeDao td = new TypeDao();
		
		//test add type
		/*t.setTypeid(15);
		t.setTypename("悲剧");
		if(td.addType(t) == true){
			System.out.println("add type successful!");
		}
		else System.out.println("add type failed!");*/
		
		//test delete type
		/*t.setTypeid(15);
		if(td.deleteType(t) == true){
			System.out.println("delete type successful!");
		}
		else System.out.println("delete type failed!");*/
	}

}
