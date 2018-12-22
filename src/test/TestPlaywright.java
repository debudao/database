package test;

import java.sql.SQLException;

import dao.PlaywrightDao;
import entity.Playwright;

public class TestPlaywright {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		Playwright pl = new Playwright();
		PlaywrightDao pd = new PlaywrightDao();
		
		//test add playwright
		/*pl.setPlaywrightid(31);
		pl.setPlaywrightname("黄渤");
		if(pd.addPlaywright(pl) == true){
			System.out.println("add playwright successful!");
		}
		else System.out.println("add playwright failed!");*/
		
		//test delete playwright
		/*pl.setPlaywrightid(31);
		if(pd.deletePlaywright(pl) == true){
			System.out.println("delete playwright successful!");
		}
		else System.out.println("delete playwright failed!");*/
		
	}

}
