package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
				rts.setDiaChi(rs.getString("diaChi"));
				rts.setHinhAnh(rs.getString("hinhAnh"));
				rts.setMonNoiTieng(rs.getString("monNoiTieng"));
				rts.setIdLoaiQuanAn(rs.getInt("idLoaiQuanAn"));
				rts.setLat(rs.getFloat("lat"));
				rts.setLng(rs.getFloat("lng"));
				rts.setLuotTraCuu(rs.getInt("luotTraCuu"));
				rts.setMoTa(rs.getString("moTa"));
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
	
	public ArrayList<Restaurant> getTop4RTS()
	{

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		
		Connection connection=DBConnect.getConnection();
		ArrayList<Restaurant> list = new ArrayList<>();
		String sql="SELECT * FROM top4rts";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Restaurant rts = new Restaurant();	
				rts.setId(rs.getInt("id"));
				rts.setTenQuanAn(rs.getString("tenQuanAn"));
				rts.setDiaChi(rs.getString("diaChi"));
				rts.setHinhAnh(rs.getString("hinhAnh"));
				rts.setMonNoiTieng(rs.getString("monNoiTieng"));
				rts.setIdLoaiQuanAn(rs.getInt("idLoaiQuanAn"));
				rts.setLat(rs.getFloat("lat"));
				rts.setLng(rs.getFloat("lng"));
				rts.setLuotTraCuu(rs.getInt("luotTraCuu"));
				rts.setMoTa(rs.getString("moTa"));
				
				list.add(rts);
			}
			ps.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
		
	}
}
