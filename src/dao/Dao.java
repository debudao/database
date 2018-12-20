package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public interface Dao {

	public abstract Connection getConnection() throws SQLException;
	public abstract void release(Connection conn, Statement st, ResultSet rs) throws SQLException;
	
}
