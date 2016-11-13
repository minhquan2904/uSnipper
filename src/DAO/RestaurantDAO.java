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
}
