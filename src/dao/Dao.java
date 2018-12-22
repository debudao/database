package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public interface Dao {

	public abstract Connection getConnection() throws SQLException;
	public abstract void release(Connection conn, PreparedStatement ps, ResultSet rs) throws SQLException;
	
}
