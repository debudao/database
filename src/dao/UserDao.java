package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.omg.CosNaming.NamingContextExtPackage.AddressHelper;

import db.C3P0JdbcUtil;
import entity.User;

public class UserDao {

	Connection conn;
	PreparedStatement ps;
	
	public UserDao() throws SQLException {
		conn = C3P0JdbcUtil.getConnection();
	}
	
	public boolean addUser(User user) throws SQLException{
		String sql="insert User(email,password,uname,phone)"
				+ " values(?,?,?,?)";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, user.getEmail());
		ps.setString(2, user.getPassword());
		ps.setString(3, user.getUname());
		ps.setString(4, user.getPhone());
		int flag=ps.executeUpdate();
		
		return flag==1?true:false;	
	}
	
	public boolean updateUser(User user) throws SQLException{
		String sql="update User set password=?,uname=?,phone=? "
				+ "where uid=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1,user.getPassword());
		ps.setString(2, user.getUname());
		ps.setString(3, user.getPhone());
		ps.setInt(4, user.getUid());
		int flag=ps.executeUpdate();
		
		return flag==1?true:false;		
	}
	
}
