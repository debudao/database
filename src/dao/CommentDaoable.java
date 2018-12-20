package dao;

import java.sql.SQLException;

import entity.Movie;
import entity.User;

public interface CommentDaoable extends Dao {

	/**
	 * add a comment to the movie
	 * @param u the author of the comment
	 * @param m the movie which will be commented
	 * @param comment the comment content to the movie
	 * @param score the score to the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addComment(User u,Movie m, String comment,float score) throws SQLException;
	
	/**
	 * delete a comment from the movie
	 * @param u the author of the comment
	 * @param m the movie of the comment
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteComment(User u, Movie m) throws SQLException;
	
}
