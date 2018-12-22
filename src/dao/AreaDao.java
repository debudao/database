package dao;

import java.sql.SQLException;

import entity.Area;

public class AreaDao extends DaoBase implements AreaDaoable {

	
	private static final String ADD_AREA_SQL="insert area(areaid,areaname) "
			+ "values(?,?)";
	
	@Override
	public boolean addArea(Area a) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(ADD_AREA_SQL);
		ps.setInt(1, a.getAreaid());
		ps.setString(2, a.getAreaname());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String DELETE_AREA_SQL="delete from area "
			+ "where areaid=?";
	
	@Override
	public boolean deleteArea(Area a) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_AREA_SQL);
		ps.setInt(1, a.getAreaid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

}
