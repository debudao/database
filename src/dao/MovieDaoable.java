package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import entity.*;

public interface MovieDaoable extends Dao {

	/**
	 * add a movie to table "movie"
	 * @param m the movie you want to add
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addMovie(Movie m) throws SQLException;
	
	/**
	 * add a picture to a movie
	 * @param m the movie you want to add a picture
	 * @param picture the picture added to the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addMoviePicture(Movie m,Picture picture) throws SQLException;	
	
	/**
	 * delete a picture from a movie
	 * @param m the movie you want to delete a picture
	 * @param picture the picture deleted from the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteMoviePicture(Movie m,Picture picture) throws SQLException;
	
	/**
	 * get all pictures of the movie
	 * @param movie the movie you want to get the picture
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Picture> getAllPictures(Movie movie) throws SQLException;
	
	/**
	 * add a type to a movie
	 * @param m the movie you want to add a type
	 * @param type the type added to the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addMovieType(Movie m,Type type) throws SQLException;
	
	/**
	 * delete a type from a movie
	 * @param m the movie you want to delete a type
	 * @param type the type deleted from the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteMovieType(Movie m,Type type) throws SQLException;
	
	/**
	 * search all the movies by type
	 * @param type the type of the movies you want to search
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Movie> searchMovieByType(Type type) throws SQLException;
	
	/**
	 * get all type of the movie
	 * @param movie the movie you want to get the type
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Type> getAllType(Movie movie) throws SQLException;
	
	/**
	 * add a area to a movie
	 * @param m the movie you want to add a area
	 * @param area the area added to the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addMovieArea(Movie m,Area area) throws SQLException;
	
	/**
	 * delete a area from a movie
	 * @param m the movie you want to delete a area
	 * @param area the area deleted from the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteMovieArea(Movie m,Area area) throws SQLException;
	
	/**
	 * search all the movies by area
	 * @param area the area of the movies you want to search
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Movie> searchMovieByArea(Area area) throws SQLException;
	
	/**
	 * get all area of the movie
	 * @param movie the movie you want to get the area
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Area> getAllArea(Movie movie) throws SQLException;
	
	/**
	 * add a director to a movie
	 * @param m the movie you want to add a director
	 * @param director the director added to the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addMovieDirector(Movie m,Director director) throws SQLException;
	
	/**
	 * delete a director from a movie
	 * @param m the movie you want to delete a director
	 * @param director the director deleted from the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteMovieDirector(Movie m,Director director) throws SQLException;
	
	/**
	 * search all the movies by director
	 * @param director the director of the movies you want to search
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Movie> searchMovieByDirector(Director director) throws SQLException;
	
	/**
	 * get all director of the movie
	 * @param movie the movie you want to get the director
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Director> getAllDirector(Movie movie) throws SQLException;
	
	/**
	 * add a actor to a movie
	 * @param m the movie you want to add a actor
	 * @param actor the actor added to the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addMovieActor(Movie m,Actor actor) throws SQLException;
	
	/**
	 * delete a actor from a movie
	 * @param m the movie you want to delete a actor
	 * @param actor the actor deleted from the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteMovieActor(Movie m,Actor actor) throws SQLException;
	
	/**
	 * search all the movies by actor
	 * @param actor the actor of the movies you want to search
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Movie> searchMovieByActor(Actor actor) throws SQLException;
	
	/**
	 * get all actor of the movie
	 * @param movie the movie you want to get the actor
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Actor> getAllActor(Movie movie) throws SQLException;
	
	/**
	 * add a playwright to a movie
	 * @param m the movie you want to add a playwright
	 * @param playwright the playwright added to the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean addMoviePlaywright(Movie m,Playwright playwright) throws SQLException;

	/**
	 * delete a playwright from a movie
	 * @param m the movie you want to delete a playwright
	 * @param playwright the playwright deleted from the movie
	 * @return if success return true,else return false
	 * @throws SQLException
	 */
	public boolean deleteMoviePlaywright(Movie m,Playwright playwright) throws SQLException;
	
	/**
	 * search all the movies by playwright
	 * @param playwright the playwright of the movies you want to search
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Movie> searchMovieByPlaywright(Playwright playwright) throws SQLException;
	
	/**
	 * get all playwright of the movie
	 * @param movie the movie you want to get the playwright
	 * @return a list of movies
	 * @throws SQLException
	 */
	public ArrayList<Playwright> getAllPlaywright(Movie movie) throws SQLException;
	
	/**
	 * get the average score of the movie
	 * @param m the movie you want to get the average score
	 * @return the average score of the movie
	 * @throws SQLException
	 */
	public float getAverScore(Movie m) throws SQLException;
}
