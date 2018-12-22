package dao;

import java.sql.SQLException;

import entity.Picture;

public class PictureDao extends DaoBase implements PictureDaoable {

	private static final String ADD_PICTURE_SQL = "insert picture(picid,piclocation) "
			+ "values(?,?)";

	@Override
	public boolean addPicture(Picture p) throws SQLException {

		conn = getConnection();
		ps = conn.prepareStatement(ADD_PICTURE_SQL);
		ps.setInt(1, p.getPicid());
		ps.setString(2, p.getPiclocation());
		int flag = ps.executeUpdate();

		release(conn, ps, rs);
		return flag == 1 ? true : false;

	}

	private static final String DELETE_PICTURE_SQL = "delete from picture "
			+ "where picid=?";

	@Override
	public boolean deletePicture(Picture p) throws SQLException {

		conn = getConnection();
		ps = conn.prepareStatement(DELETE_PICTURE_SQL);
		ps.setInt(1, p.getPicid());
		int flag = ps.executeUpdate();

		release(conn, ps, rs);
		return flag == 1 ? true : false;
	}

}
