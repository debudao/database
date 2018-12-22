package dao;

import java.sql.SQLException;

import entity.Director;

public class DirectorDao extends DaoBase implements DirectorDaoable {

	private static final String ADD_DIRECTOR_SQL = "insert director(directorid,directorname) "
			+ "values(?,?)";

	@Override
	public boolean addDirector(Director d) throws SQLException {

		conn = getConnection();
		ps = conn.prepareStatement(ADD_DIRECTOR_SQL);
		ps.setInt(1, d.getDirectorid());
		ps.setString(2, d.getDirectorname());
		int flag = ps.executeUpdate();

		release(conn, ps, rs);
		return flag == 1 ? true : false;
	}

	private static final String DELETE_DIRECTOR_SQL = "delete from director "
			+ "where directorid=?";

	@Override
	public boolean deleteDirector(Director d) throws SQLException {

		conn = getConnection();
		ps = conn.prepareStatement(DELETE_DIRECTOR_SQL);
		ps.setInt(1, d.getDirectorid());
		int flag = ps.executeUpdate();

		release(conn, ps, rs);
		return flag == 1 ? true : false;
	}

}
