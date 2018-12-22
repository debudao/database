package dao;

import java.sql.SQLException;

import entity.Actor;

public interface ActorDaoable extends Dao {

	/**
	 * add a new actor 
	 * @param a the actor you want to add
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addActor(Actor a) throws SQLException;
	
	/**
	 * delete a actor
	 * @param a the actor you want to delete
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteActor(Actor a) throws SQLException;
	
}
