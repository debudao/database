package dao;

import java.sql.SQLException;

import entity.*;

public interface DirectorDaoable {

	/**
	 * add a new Director 
	 * @param a the Director you want to add
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addDirector(Director d) throws SQLException;
	
	/**
	 * delete a Director
	 * @param a the Director you want to delete
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteDirector(Director d) throws SQLException;
	
}
