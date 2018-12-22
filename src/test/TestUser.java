package test;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.UserDao;
import entity.User;

public class TestUser {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		User user = new User();
		UserDao ud = new UserDao();
		//add user test
		/*user.setEmail("yangth@163.com");
		user.setPassword("123456");
		user.setPhone("13098765230");
		user.setUname("杨提韩");
		if(ud.addUser(user) == true){
			System.out.println("add user successful!");
		}
		else System.out.println("add user failed!");*/
		
		//update user test
		/*user.setUname("杨嘻嘻");
		user.setUid(23);
		user.setPhone("13098765230");
		user.setPassword("123456");
		if(ud.updateUser(user) == true){
			System.out.println("update user info successful!");
		}
		else System.out.println("update user info failed!");*/
		
		//search user
		/*ArrayList<User> users = ud.searchUser("张三");
		for(int i=0;i<users.size();i++){
			System.out.println(users.get(i).getUname()+ " " +users.get(i).getPhone()+ " " +users.get(i).getEmail());
		}*/
		
		//login test
		/*if(ud.loginUser("LMiss@163.com", "12asdasdx") == true){
			System.out.println("user login successful!");
		}
		else System.out.println("user login failed!");*/
		
	}

}
