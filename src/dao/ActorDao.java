package dao;

import java.sql.SQLException;

import entity.Actor;

public class ActorDao extends DaoBase implements ActorDaoable {

	private static final String ADD_ACTOR_SQL="insert actor(aid,aname,asex,aBirthday) "
			+ "values(?,?,?,?)";
	
	@Override
	public boolean addActor(Actor a) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(ADD_ACTOR_SQL);
		ps.setInt(1, a.getAid());
		ps.setString(2, a.getAname());
		ps.setString(3, a.getAsex());
		ps.setString(4, a.getaBirthday());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
		
	}
	
	private static final String DELETE_ACTOR_SQL="delete from actor "
			+ "where aid=?";

	@Override
	public boolean deleteActor(Actor a) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_ACTOR_SQL);
		ps.setInt(1, a.getAid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
		
	}

}
