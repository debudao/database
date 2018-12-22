package test;

import java.sql.SQLException;

import dao.CommentDao;
import entity.Movie;
import entity.User;

public class TestComment {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		CommentDao cd = new CommentDao();
		User u = new User();
		Movie m = new Movie();
		
		//test add comment of movie 
		/*u.setUid(1);
		m.setMid(5);
		if(cd.addComment(u, m, "很好看，很给力！", 8) == true){
			System.out.println("add comment successful!");
		}
		else System.out.println("add comment failed!");*/
		
		//test delete comment of movie
		/*u.setUid(1);
		m.setMid(5);
		if(cd.deleteComment(u, m) == true){
			System.out.println("delete comment successful!");
		}
		else System.out.println("delete comment failed!");*/
	}

}
