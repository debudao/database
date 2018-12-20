package dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import entity.Movie;
import entity.User;

public class CommentDao extends DaoBase implements CommentDaoable {
	
	private static final String ADD_COMMENT_SQL="insert comment(uid,mid,score,comment,commentDate,usefulNumber)"
			+ " values(?,?,?,?,?,?)";

	@Override
	public boolean addComment(User u, Movie m, String comment, float score)throws SQLException {
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		conn=getConnection();
		ps=conn.prepareStatement(ADD_COMMENT_SQL);
		ps.setInt(1, u.getUid());
		ps.setInt(2, m.getMid());
		ps.setFloat(3, score);
		ps.setString(4, comment);
		ps.setString(5, df.format(new Date()).toString());
		ps.setInt(6, 0);
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String DELETE_COMMENT_SQL="delete from comment "
			+ "where uid=? and mid=?";
	
	@Override
	public boolean deleteComment(User u, Movie m) throws SQLException {
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_COMMENT_SQL);
		ps.setInt(1, u.getUid());
		ps.setInt(2, m.getMid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);		
		return flag==1?true:false;
	}

}
