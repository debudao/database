package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import entity.User;

public interface UserDaoable extends Dao {

	/**
	 * add a user to the table "User"
	 * @param user the user you want to add
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addUser(User user) throws SQLException;
	
	/**
	 * update the data of the user
	 * @param user the user you want to update
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean updateUser(User user) throws SQLException;
	
	/**
	 * search the user by the name
	 * @param name the name of the user you want to search
	 * @return a list of the user whose name is similar to name
	 * @throws SQLException
	 */
	public ArrayList<User> searchUser(String name) throws SQLException;
	
	/**
	 * login in
	 * @param email email of the user you want to login in
	 * @param password password of the you user want to login in
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean loginUser(String email,String password) throws SQLException;
	
}
