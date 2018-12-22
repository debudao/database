package dao;

import java.sql.SQLException;

import entity.Type;

public class TypeDao extends DaoBase implements TypeDaoable {

	private static final String ADD_TYPE_SQL = "insert type(typeid,typename) "
			+ "values(?,?)";

	@Override
	public boolean addType(Type t) throws SQLException {

		conn = getConnection();
		ps = conn.prepareStatement(ADD_TYPE_SQL);
		ps.setInt(1, t.getTypeid());
		ps.setString(2, t.getTypename());
		int flag = ps.executeUpdate();

		release(conn, ps, rs);
		return flag == 1 ? true : false;
	}

	private static final String DELETE_TYPE_SQL = "delete from area "
			+ "where areaid=?";

	@Override
	public boolean deleteType(Type t) throws SQLException {

		conn = getConnection();
		ps = conn.prepareStatement(DELETE_TYPE_SQL);
		ps.setInt(1, t.getTypeid());
		int flag = ps.executeUpdate();

		release(conn, ps, rs);
		return flag == 1 ? true : false;
	}

}
