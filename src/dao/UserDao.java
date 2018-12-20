package dao;


import java.sql.SQLException;
import java.util.ArrayList;


import entity.User;

public class UserDao extends DaoBase implements UserDaoable{

	private static final String ADD_USER_SQL="insert User(email,password,uname,phone)"
			+ " values(?,?,?,?)";
	private static final String UPDATE_USER_SQL="update User set password=?,uname=?,phone=? "
			+ "where uid=?";
	private static final String SEARCH_USER_SQL="select * from user "
			+ "where uname like %?%";
	private static final String LOGIN_USER_SQL="select * from user "
			+ "where email=? and password=?";
	
	

	
	
	@Override
	public boolean addUser(User user) throws SQLException{		
		conn = getConnection();
		ps = conn.prepareStatement(ADD_USER_SQL);
		ps.setString(1, user.getEmail());
		ps.setString(2, user.getPassword());
		ps.setString(3, user.getUname());
		ps.setString(4, user.getPhone());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;	
	}
	
	@Override
	public boolean updateUser(User user) throws SQLException{
		conn = getConnection();
		ps = conn.prepareStatement(UPDATE_USER_SQL);
		ps.setString(1,user.getPassword());
		ps.setString(2, user.getUname());
		ps.setString(3, user.getPhone());
		ps.setInt(4, user.getUid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;		
	}


	@Override
	public ArrayList<User> searchUser(String name) throws SQLException {
		conn = getConnection();
		ps=conn.prepareStatement(SEARCH_USER_SQL);
		ps.setString(1, name);
		rs=ps.executeQuery();
		
		ArrayList<User> users=new ArrayList<User>();
		while(rs.next()){
			User u=new User();
			u.setEmail(rs.getString("email"));
			u.setUname(rs.getString("uname"));
			u.setPhone(rs.getString("phone"));
			users.add(u);
		}
		
		release(conn, ps, rs);
		return users;
	}



	@Override
	public boolean loginUser(String email, String password) throws SQLException {
		conn = getConnection();
		ps=conn.prepareStatement(LOGIN_USER_SQL);
		ps.setString(1, email);
		ps.setString(2, password);
		rs=ps.executeQuery();
		
		release(conn, ps, rs);
		return rs.next();
	}
	
}
