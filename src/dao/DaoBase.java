package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DaoBase implements Dao {

	private ComboPooledDataSource ds = null;
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;

	public DaoBase() {
		ds = new ComboPooledDataSource("MySQL");
	}

	@Override
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

	@Override
	public void release(Connection conn, PreparedStatement ps, ResultSet rs) throws SQLException {
		if (rs != null)
			rs.close();

		if (ps != null)
			ps.close();

		if (conn != null)
			conn.close();

	}

}
