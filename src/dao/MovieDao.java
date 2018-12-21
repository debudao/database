package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import entity.Movie;

public class MovieDao {

//	Connection conn;
//	PreparedStatement ps;
//	
//	public MovieDao() throws SQLException {
//		conn = C3P0JdbcUtil.getConnection();
//	}
//	
//	/**
//	 * add a movie to table "movie"
//	 * @param m the movie you want to add
//	 * @return if success return true,else return false
//	 * @throws SQLException
//	 */
//	public boolean addMovie(Movie m) throws SQLException{
//		String sql="insert movie(mname,type,area,mscore,alias,intro,imdbUrl,language,releaseDate,duration) "
//				+ "values(?,?,?,?,?,?,?,?,?,?)";
//		float score=this.getAverScore(m.getMid());
//		ps = conn.prepareStatement(sql);
//		ps.setString(1, m.getMname());
//		ps.setString(2, m.getType());
//		ps.setString(3, m.getArea());
//		ps.setFloat(4, score);
//		ps.setString(5, m.getAlias());
//		ps.setString(6, m.getIntro());
//		ps.setString(7, m.getImdbUrl());
//		ps.setString(8, m.getLanguage());
//		ps.setString(9, m.getReleaseDate());
//		ps.setInt(10, m.getDuration());
//		
//		int flag=ps.executeUpdate();
//		
//		ps.close();
//		C3P0JdbcUtil.release(conn, null, null);
//		return flag==1?true:false;
//			
//		
//	}
//	
//	//get the average score from the table "comment" 
//	private float getAverScore(int mid) throws SQLException{
//		String sql="select AVG(score) from comment where mid=?";
//		ps = conn.prepareStatement(sql);
//		ps.setInt(1, mid);
//		ResultSet rs=ps.executeQuery();
//		float f=0;
//		
//		if(rs.next())
//			f=rs.getFloat("AVG(score)");		
//
//		ps.close();
//		C3P0JdbcUtil.release(conn, null, rs);
//		return f;
//	}
}
