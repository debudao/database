package dao;

import java.sql.SQLException;

import entity.*;

public interface PictureDaoable {

	/**
	 * add a new Picture 
	 * @param a the Picture you want to add
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addPicture(Picture p) throws SQLException;
	
	/**
	 * delete a Picture
	 * @param a the Picture you want to delete
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deletePicture(Picture p) throws SQLException;
	
}
