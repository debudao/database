package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DaoBase implements Dao {

	private ComboPooledDataSource ds = null;

	public DaoBase() {
		ds = new ComboPooledDataSource("MySQL");
	}

	@Override
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

	@Override
	public void release(Connection conn, Statement st, ResultSet rs) throws SQLException {
		if (rs != null)
			rs.close();

		if (st != null)
			st.close();

		if (conn != null)
			conn.close();

	}

}
