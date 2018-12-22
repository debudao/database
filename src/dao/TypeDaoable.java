package dao;

import java.sql.SQLException;

import entity.*;

public interface TypeDaoable {

	/**
	 * add a new Type 
	 * @param a the Type you want to add
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addType(Type t) throws SQLException;
	
	/**
	 * delete a Type
	 * @param a the Type you want to delete
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteType(Type t) throws SQLException;
	
}
