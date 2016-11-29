package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import Connect.DBConnect;
//import dao.UserDAO;
//import connect.DBConnect;
import model.Role;
import model.User;


public class UserDAO {
	
	public User findUserById(Integer id) throws SQLException{
		Connection connection=DBConnect.getConnection();
		User user=new User();
		
		String sql="Select * from nguoidung Where nguoidung.id="+id;
		PreparedStatement ps=connection.prepareCall(sql);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			user.setId(rs.getInt("id"));
			user.setUserName((rs.getString("userName")));
			user.setEmail(rs.getString("email"));
			user.setTenNguoiDung(rs.getString("tenNguoiDung"));
			user.setPass(rs.getString("pass"));
			user.setHinhAnh(rs.getString("hinhAnh"));
			user.setSoThich(rs.getString("soThich"));
			user.setQuyen(rs.getInt("Quyen"));
			
			return user;
		}
		
		return null;
	}
	public User findUserByUsn(String userName) throws SQLException{
		Connection connection=DBConnect.getConnection();
		User user=new User();
		
		String sql="SELECT * FROM nguoidung WHERE userName='"+userName+"'";
		PreparedStatement ps=connection.prepareCall(sql);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			user.setId(rs.getInt("id"));
			user.setUserName((rs.getString("userName")));
			user.setEmail(rs.getString("email"));
			user.setTenNguoiDung(rs.getString("tenNguoiDung"));
			user.setPass(rs.getString("pass"));
			user.setHinhAnh(rs.getString("hinhAnh"));
			user.setSoThich(rs.getString("soThich"));
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
				user.setUserName(userName);
				user.setTenNguoiDung(rs.getString("tenNguoiDung"));
				
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
				user.setUserName(rs.getString("userName"));
				user.setPass(rs.getString("pass"));
				user.setTenNguoiDung(rs.getString("tenNguoiDung"));
				user.setHinhAnh(rs.getString("hinhAnh"));
				user.setNgayDangKy(rs.getDate("ngayDangKy"));
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
	public boolean  insertUser(User user) {
		
		Connection connection=DBConnect.getConnection();
		String sql= "INSERT INTO NguoiDung (userName,Pass,tenNguoiDung,Quyen) VALUES(?,?,?,?)";
		 try {
	            PreparedStatement ps = (PreparedStatement)connection.prepareCall(sql);         
	            ps.setString(1, user.getUserName());	          
	            ps.setString(2, user.getPass());
	            ps.setString(3, user.getTenNguoiDung());
	            ps.setInt(4,user.getQuyen());	            
	            ps.executeUpdate();
	            ps.close();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
