package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connect.DBConnect;
import model.Restaurant;

public class RestaurantDAO {
	public Restaurant getInfoById(Integer id)
	{
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		Connection connection = DBConnect.getConnection();
		Restaurant rts = new Restaurant();		
		String sql = "SELECT * from quanan WHERE id="+id;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				rts.setId(rs.getInt("id"));
				rts.setTenQuanAn(rs.getString("tenQuanAn"));
				rts.setSoNha(rs.getInt("soNha"));
				rts.setTenDuong(rs.getString("tenDuong"));
				rts.setTenPhuong(rs.getString("tenPhuong"));
				rts.setTenQuan(rs.getString("tenQuan"));
				rts.setHinhAnh(rs.getString("hinhAnh"));
				rts.setMonNoiTieng(rs.getString("monNoiTieng"));
				rts.setIdLoaiQuanAn(rs.getInt("idLoaiQuanAn"));
				rts.setLat(rs.getString("lat"));
				rts.setLng(rs.getString("lng"));
				rts.setLuotTraCuu(rs.getInt("luotTraCuu"));
				rts.setMoTa(rs.getString("moTa"));
				rts.setNgayThem(rs.getDate("ngayThem"));
				rts.setDiemTB(rs.getFloat("diemTB"));
				rts.setLuotDanhGia(rs.getInt("luotDanhGia"));
				ps.close();
				return rts;			
				
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("SQL error -------------------");
		}
		return null;
	}
	
	public ArrayList<Restaurant> getTopRTS()
	{

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		
		Connection connection=DBConnect.getConnection();
		ArrayList<Restaurant> list = new ArrayList<>();
		String sql="SELECT * FROM toprts";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Restaurant rts = new Restaurant();	
				rts.setId(rs.getInt("id"));
				rts.setTenQuanAn(rs.getString("tenQuanAn"));
				rts.setSoNha(rs.getInt("soNha"));
				rts.setTenDuong(rs.getString("tenDuong"));
				rts.setTenPhuong(rs.getString("tenPhuong"));
				rts.setHinhAnh(rs.getString("hinhAnh"));
				rts.setMonNoiTieng(rs.getString("monNoiTieng"));
				rts.setIdLoaiQuanAn(rs.getInt("idLoaiQuanAn"));
				rts.setLat(rs.getString("lat"));
				rts.setLng(rs.getString("lng"));
				rts.setLuotTraCuu(rs.getInt("luotTraCuu"));
				rts.setMoTa(rs.getString("moTa"));
				rts.setNgayThem(rs.getDate("ngayThem"));
				rts.setDiemTB(rs.getFloat("diemTB"));
				rts.setLuotDanhGia(rs.getInt("luotDanhGia"));
				list.add(rts);
			}
			ps.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
		
	}
	public ArrayList<Restaurant> getListRtsTD()
	{

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		
		Connection connection=DBConnect.getConnection();
		ArrayList<Restaurant> list = new ArrayList<>();
		String sql="SELECT * FROM quanan WHERE quanan.tenQuan ='Thủ Đức'";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Restaurant rts = new Restaurant();	
				rts.setId(rs.getInt("id"));
				rts.setTenQuanAn(rs.getString("tenQuanAn"));
				rts.setSoNha(rs.getInt("soNha"));
				rts.setTenDuong(rs.getString("tenDuong"));
				rts.setTenPhuong(rs.getString("tenPhuong"));
				rts.setTenQuan(rs.getString("tenQuan"));
				rts.setHinhAnh(rs.getString("hinhAnh"));
				rts.setMonNoiTieng(rs.getString("monNoiTieng"));
				rts.setIdLoaiQuanAn(rs.getInt("idLoaiQuanAn"));
				rts.setLat(rs.getString("lat"));
				rts.setLng(rs.getString("lng"));
				rts.setLuotTraCuu(rs.getInt("luotTraCuu"));
				rts.setMoTa(rs.getString("moTa"));
				rts.setNgayThem(rs.getDate("ngayThem"));
				rts.setDiemTB(rs.getFloat("diemTB"));
				rts.setLuotDanhGia(rs.getInt("luotDanhGia"));
				list.add(rts);
			}
			ps.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
		
	}
	public ArrayList<Restaurant> getListRtsQ9()
	{

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		
		Connection connection=DBConnect.getConnection();
		ArrayList<Restaurant> list = new ArrayList<>();
		String sql="SELECT * FROM quanan WHERE quanan.tenQuan ='Quận 9'";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Restaurant rts = new Restaurant();	
				rts.setId(rs.getInt("id"));
				rts.setTenQuanAn(rs.getString("tenQuanAn"));
				rts.setSoNha(rs.getInt("soNha"));
				rts.setTenDuong(rs.getString("tenDuong"));
				rts.setTenPhuong(rs.getString("tenPhuong"));
				rts.setTenQuan(rs.getString("tenQuan"));
				rts.setHinhAnh(rs.getString("hinhAnh"));
				rts.setMonNoiTieng(rs.getString("monNoiTieng"));
				rts.setIdLoaiQuanAn(rs.getInt("idLoaiQuanAn"));
				rts.setLat(rs.getString("lat"));
				rts.setLng(rs.getString("lng"));
				rts.setLuotTraCuu(rs.getInt("luotTraCuu"));
				rts.setMoTa(rs.getString("moTa"));
				rts.setNgayThem(rs.getDate("ngayThem"));
				rts.setDiemTB(rs.getFloat("diemTB"));
				rts.setLuotDanhGia(rs.getInt("luotDanhGia"));
				list.add(rts);
			}
			ps.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
		
	}
	
	public ArrayList<Restaurant> getNewRts()
	{

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		
		Connection connection=DBConnect.getConnection();
		ArrayList<Restaurant> list = new ArrayList<>();
		String sql="SELECT * FROM newrts";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Restaurant rts = new Restaurant();	
				rts.setId(rs.getInt("id"));
				rts.setTenQuanAn(rs.getString("tenQuanAn"));
				rts.setSoNha(rs.getInt("soNha"));
				rts.setTenDuong(rs.getString("tenDuong"));
				rts.setTenPhuong(rs.getString("tenPhuong"));
				rts.setTenQuan(rs.getString("tenQuan"));
				rts.setHinhAnh(rs.getString("hinhAnh"));
				rts.setMonNoiTieng(rs.getString("monNoiTieng"));
				rts.setIdLoaiQuanAn(rs.getInt("idLoaiQuanAn"));
				rts.setLat(rs.getString("lat"));
				rts.setLng(rs.getString("lng"));
				rts.setLuotTraCuu(rs.getInt("luotTraCuu"));
				rts.setMoTa(rs.getString("moTa"));
				rts.setNgayThem(rs.getDate("ngayThem"));
				rts.setDiemTB(rs.getFloat("diemTB"));
				rts.setLuotDanhGia(rs.getInt("luotDanhGia"));
				list.add(rts);
			}
			ps.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
		
	}
	//Tinh luot binh luan
	public Integer getTotalcommentById(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		Integer total = 0;
		String sql="SELECT COUNT(nhanxet.noiDung) as luotBinhLuan"
				+ " FROM quanan join nhanxet on quanan.id = nhanxet.idQuanAn "
				+ "WHERE quanan.id ="+id;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				total = rs.getInt("luotBinhLuan");
				ps.close();
				return total;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	//Tang luot view khi click vao quan an
	
	public void updateView(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		String sql="UPDATE quanan SET quanan.luotTraCuu = quanan.luotTraCuu +1 WHERE quanan.id ="+id;
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.executeUpdate();
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void updateInfo(Integer id, String tenQuanAn, Integer soNha, String tenDuong, String tenPhuong, String moTa, String monNoiTieng)
	{
		Connection connection = DBConnect.getConnection();
		String sql="UPDATE quanan "
				+ "SET tenQuanAn=?,soNha=?,tenDuong=?,tenPhuong=?,moTa=?,monNoiTieng=? "
				+ " WHERE quanan.id ="+id;
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, tenQuanAn);
			ps.setInt(2, soNha);
			ps.setString(3, tenDuong);
			ps.setString(4, tenPhuong);
			ps.setString(5, moTa);
			ps.setString(6, monNoiTieng);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertRts(String tenQuanAn,Integer idLoaiQuanAn, Integer soNha, String tenDuong, String tenPhuong, String tenQuan,String lat,String lng,String pic)
	{
		
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO quanan(tenQuanAn,soNha,tenDuong,tenPhuong,tenQuan,lat,lng,idLoaiQuanAn,hinhAnh,ngayThem) "
				+ "VALUES(?,?,?,?,?,?,?,?,?,CURDATE())";
		
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, tenQuanAn);
			ps.setInt(2, soNha);
			ps.setString(3, tenDuong);
			ps.setString(4, tenPhuong);
			ps.setString(5, tenQuan);
			ps.setString(6, lat);
			ps.setString(7, lng); 
			ps.setInt(8, idLoaiQuanAn);
			ps.setString(9, pic);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Boolean hasRts(String tenQuanAn)
	{
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM quanan WHERE quanan.tenQuanAn ='"+tenQuanAn+"'";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
	public Integer getIdByName(String tenQuanAn)
	{
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT quanan.id FROM quanan WHERE quanan.tenQuanAn ='"+tenQuanAn+"'";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				Integer id = rs.getInt("id");
				
				return id;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
