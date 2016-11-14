package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connect.DBConnect;
import model.DishInfo;

public class DishInfoDAO {
	public ArrayList<DishInfo>  getImgByRtsId(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM quanan_monan WHERE quanan_monan.idQuanAn ="+id;
		ArrayList<DishInfo> list = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				DishInfo dish = new DishInfo();
				dish.setIdQuanAn(rs.getInt("idQuanAn"));
				dish.setIdMonAn(rs.getInt("idMonAn"));
				dish.setHinhAnh(rs.getString("hinhAnh"));
				dish.setMoTa(rs.getString("moTa"));
				dish.setGiaTien(rs.getDouble("giaTien"));
				
				list.add(dish);
			}
			
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
}
