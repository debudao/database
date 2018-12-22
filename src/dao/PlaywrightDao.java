package dao;

import java.sql.SQLException;

import entity.Playwright;

public class PlaywrightDao extends DaoBase implements PlaywrightDaoable {

	private static final String ADD_PLAYWRIGHT_SQL = "insert playwright(playwrightid,playwrightname) "
			+ "values(?,?)";

	@Override
	public boolean addPlaywright(Playwright p) throws SQLException {

		conn = getConnection();
		ps = conn.prepareStatement(ADD_PLAYWRIGHT_SQL);
		ps.setInt(1, p.getPlaywrightid());
		ps.setString(2, p.getPlaywrightname());
		int flag = ps.executeUpdate();

		release(conn, ps, rs);
		return flag == 1 ? true : false;
	}

	private static final String DELETE_PLAYWRIGHT_SQL = "delete from playwright "
			+ "where playwrightid=?";

	@Override
	public boolean deletePlaywright(Playwright p) throws SQLException {

		conn = getConnection();
		ps = conn.prepareStatement(DELETE_PLAYWRIGHT_SQL);
		ps.setInt(1, p.getPlaywrightid());
		int flag = ps.executeUpdate();

		release(conn, ps, rs);
		return flag == 1 ? true : false;
	}

}
