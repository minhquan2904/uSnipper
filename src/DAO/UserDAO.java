package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
			ps.close();
			connection.close();
			rs.close();
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
			ps.close();
			connection.close();
			rs.close();
			return user;
		}
		
		return null;
	}
	public ArrayList<User> findUserByUsnForAdmin(String userName) throws SQLException{
		Connection connection=DBConnect.getConnection();	
		
		String sql="SELECT id,email,tenNguoiDung,trangThai FROM nguoidung WHERE Quyen=1 and tenNguoiDung  LIKE N'%"+userName+"%' ";
		PreparedStatement ps=connection.prepareCall(sql);
		ResultSet rs=ps.executeQuery();
		ArrayList<User> list = new ArrayList<>();
		while(rs.next()){
			User user=new User();
			user.setId(rs.getInt("id"));			
			user.setEmail(rs.getString("email"));	
			user.setTenNguoiDung(rs.getString("tenNguoiDung"));
			user.setTrangThai(rs.getInt("trangThai"));
			list.add(user);
			
		}
		ps.close();
		connection.close();
		rs.close();
		if(!list.isEmpty())
		{
			return list;
		}
		else
		{
			return null;
		}
		
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
				stm.close();
				con.close();
				rs.close();	
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
				user.setTrangThai(rs.getInt("trangThai"));
				user.setNgayBlock(rs.getDate("ngayBlock"));
				ps.close();
				rs.close();
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
				stm.close();
				con.close();
				rs.close();	
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
		String sql= "INSERT INTO NguoiDung (userName,Pass,tenNguoiDung,Quyen,trangThai) VALUES(?,?,?,?,?)";
		 try {
	            PreparedStatement ps = (PreparedStatement)connection.prepareCall(sql);         
	            ps.setString(1, user.getUserName());	          
	            ps.setString(2, user.getPass());
	            ps.setString(3, user.getTenNguoiDung());
	            ps.setInt(4,user.getQuyen());
	            ps.setInt(5, 1);
	            ps.executeUpdate();
	            connection.close();
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
				stm.close();
				con.close();
				rs.close();	
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
				stm.close();
				con.close();
				rs.close();	
				return true;
			}
		}catch(SQLException e){
			System.out.println("executeQuery Fail !");
			e.printStackTrace();
		}
		return false;
	}
	public Boolean unblockUser(String username)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		String sql = "UPDATE nguoidung SET trangThai = 1, ngayBlock = NULL WHERE userName = ?";
		
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ps.setString(1, username);
			ps.executeUpdate();
			ps.close();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	public Boolean unblockMem(Integer id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		String sql = "UPDATE nguoidung SET trangThai = 1, ngayBlock = NULL WHERE id = ?";
		
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	public ArrayList<User> getListActiveEditorAdmin()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM nguoidung WHERE nguoidung.Quyen <> 1 and trangThai = 1";
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ArrayList<User> list = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("Email"));
				user.setUserName(rs.getString("userName"));
				user.setTenNguoiDung(rs.getString("tenNguoiDung"));
				
				list.add(user);
							
			}
			conn.close();
			ps.close();
			rs.close();	
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<User> getListBlockEditorAdmin()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM nguoidung WHERE nguoidung.Quyen <> 1 and trangThai = 0";
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ArrayList<User> list = new ArrayList<>();
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("Email"));
				user.setUserName(rs.getString("userName"));
				user.setTenNguoiDung(rs.getString("tenNguoiDung"));
				
				list.add(user);
							
			}
			ps.close();
			conn.close();
			rs.close();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public Boolean blockUser(Integer id,String userName)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		
		String sql="UPDATE nguoidung SET trangThai = 0, ngayBlock = CURDATE() + 7 WHERE id = ? and userName =?";
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ps.setInt(1, id);
			ps.setString(2, userName);
			ps.executeUpdate();
			ps.close();
			conn.close();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	public Boolean blockMem(Integer id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		
		String sql="UPDATE nguoidung SET trangThai = 0, ngayBlock = CURDATE() + 7 WHERE id = ?";
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ps.setInt(1, id);
			
			ps.executeUpdate();
			ps.close();
			conn.close();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	public Boolean checkBlock(Integer id)
	{

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		String sql="SELECT * FROM nguoidung WHERE id=? and trangThai = 0";
		PreparedStatement ps;
		try {
			ps = conn.prepareCall(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				ps.close();
				conn.close();
				rs.close();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	public Boolean deleteUser(Integer id,String userName)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		String sql="DELETE FROM nguoidung WHERE nguoidung.id = ? and nguoidung.userName =?";
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ps.setInt(1, id);
			ps.setString(2, userName);
			ps.executeUpdate();
			ps.close();
			conn.close();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	public Boolean deleteMem(Integer id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		String sql="DELETE FROM nguoidung WHERE nguoidung.id = ? ";
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ps.setInt(1, id);			
			ps.executeUpdate();
			ps.close();
			conn.close();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	public void changePass(Integer id, String userName,String pass)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection conn = DBConnect.getConnection();
		String sql = "UPDATE nguoidung SET pass=? WHERE id=? and userName= ?";
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ps.setString(1, pass);
			ps.setInt(2, id);
			ps.setString(3, userName);
			ps.executeUpdate();
			
			conn.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
}
