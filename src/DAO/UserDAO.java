package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Connect.*;
import model.Role;
import model.User;

public class UserDAO {

	public User findUserById(Integer id) throws SQLException{
		Connection connection=DBConnect.getConnection();
		User user=new User();
		
		String sql="Select * from user Where id="+id;
		PreparedStatement ps=connection.prepareCall(sql);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			user.setId(rs.getInt("id"));
			user.setuserName(rs.getString("userName"));
			user.setEmail(rs.getString("email"));
			user.settenNguoiDung(rs.getString("tenNguoiDung"));
			user.setPass(rs.getString("pass"));
			user.setsoThich(rs.getString("soThich"));
			user.setQuyen(rs.getInt("Quyen"));
			
			return user;
		}
		
		return null;
	}
	public static User getInfo(String userName) {
		User user = new User();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection con=null;
		Statement stm=null;
		ResultSet rs;	
		try
		{
			con=DBConnect.getConnection();
			stm=con.createStatement();
			rs=stm.executeQuery("SELECT * FROM nguoidung WHERE userName='"+userName+"'");
			if(rs.next()){
				user.setuserName(userName);
				user.settenNguoiDung(rs.getString("tenNguoiDung"));
				
				int roleid = rs.getInt("Quyen");
				ResultSet rsRole = stm.executeQuery("SELECT * FROM Quyen WHERE id='"+roleid+"'");
				if (rsRole.next()){
					Role userRole = new Role();
					userRole.setRoleId(roleid);
					user.setQuyen(userRole.getRoleId());
				}
			}
		}catch(SQLException e){
			System.out.println("executeQuery Fail !");
			e.printStackTrace();
		}
		return user;
	}
	public User Login(String userName,String pass)
	{
		
		Connection conn = DBConnect.getConnection();
		String sql="select * from nguoidung where userName= '" +userName+ "' and pass= '" +pass+ "'";
		PreparedStatement ps;
		try {
			ps=conn.prepareCall(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setuserName(rs.getString("userName"));
				user.setPass(rs.getString("pass"));
				user.settenNguoiDung(rs.getString("tenNguoiDung"));
				user.sethinhAnh(rs.getString("hinhAnh"));
				user.setngayDangKy(rs.getDate("ngayDangKy"));
				user.setQuyen(rs.getInt("Quyen"));
				conn.close();
				return user;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	public static boolean hasUser(String userName) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver");
		}
		Connection con=null;
		Statement stm=null;
		ResultSet rs;	
		try
		{
			con=DBConnect.getConnection();
			stm=con.createStatement();
			rs=stm.executeQuery("SELECT * FROM nguoidung WHERE userName='"+userName+"'");
			if(rs.next()){
				return true;
			}
		}catch(SQLException e){
			System.out.println("executeQuery fail !");
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean hasEmail(String email) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver");
		}
		Connection con=null;
		Statement stm=null;
		ResultSet rs;	
		try
		{
			con=DBConnect.getConnection();
			stm=con.createStatement();
			rs=stm.executeQuery("SELECT * FROM nguoidung WHERE email='"+email+"'");
			if(rs.next()){
				return true;
			}
		}catch(SQLException e){
			System.out.println("executeQuery fail !");
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean loginAuth(String userName, String pass) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection con=null;
		Statement stm=null;
		ResultSet rs;
		try
		{
			con=DBConnect.getConnection();
			stm=con.createStatement();
			rs=stm.executeQuery("select * from nguoidung where userName= '" +userName+ "' and pass= '" +pass+ "'");
			if(rs.next()){
				return true;
			}
		}catch(SQLException e){
			System.out.println("executeQuery Fail !");
			e.printStackTrace();
		}
		return false;
	}
	
}
