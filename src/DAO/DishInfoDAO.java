package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connect.DBConnect;
import model.Dish;
import model.DishInfo;

public class DishInfoDAO {
	public ArrayList<DishInfo>  getImgByRtsId(Integer id)
	{
		DishDAO dao = new DishDAO();
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
				dish.setGiaTien(rs.getInt("giaTien"));
				Dish dishId = dao.getDishById(rs.getInt("idMonAn"));
				dish.setDishId(dishId);
				list.add(dish);
			}
			
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public Boolean hasDish(Integer idQuanAn, Integer idMonAn)
	{
		Connection connection = DBConnect.getConnection();
		String sql="SELECT * FROM quanan_monan "
				+ "WHERE quanan_monan.idQuanAn = '"+idQuanAn+"' and quanan_monan.idMonAn= '"+idMonAn+"' ";
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
	public void insertNewInfo(Integer idQuanAn,Integer idMonAn,String hinhAnh,String moTa, Integer giaTien)
	{
		Connection connection = DBConnect.getConnection();
		String sql="INSERT INTO quanan_monan(idQuanAn,idMonAn,hinhAnh,moTa,giaTien) values (?,?,?,?,?)";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setInt(1, idQuanAn);
			ps.setInt(2, idMonAn);
			ps.setString(3, hinhAnh);
			ps.setString(4, moTa);
			ps.setInt(5, giaTien);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
}
