package dao;

import java.sql.SQLException;

import entity.*;

public interface PlaywrightDaoable {

	/**
	 * add a new Playwright 
	 * @param a the Playwright you want to add
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addPlaywright(Playwright p) throws SQLException;
	
	/**
	 * delete a Playwright
	 * @param a the Playwright you want to delete
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deletePlaywright(Playwright p) throws SQLException;
	
}
