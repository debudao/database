package dao;

import java.sql.SQLException;

import entity.*;

public interface AreaDaoable {

	/**
	 * add a new Area 
	 * @param a the Area you want to add
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addArea(Area a) throws SQLException;
	
	/**
	 * delete a Area
	 * @param a the Area you want to delete
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteArea(Area a) throws SQLException;
	
}
