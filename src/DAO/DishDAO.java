package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import Connect.DBConnect;
import model.Dish;
public class DishDAO {
	public Dish getDishById(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		String sql="SELECT * FROM monan WHERE monan.id ="+id;
		Dish dish = new Dish();
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				dish.setId(rs.getInt("id"));
				dish.setTenMonAn(rs.getString("tenMonAn"));
				return dish;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public Boolean hasDish(Integer tenMonAn)
	{
		Connection connection = DBConnect.getConnection();
		String sql ="SELECT * FROM monan WHERE monan.tenMonAn='"+tenMonAn+"'";
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
	public void insertDish(String tenMonAn, String moTa)
	{
		Connection connection = DBConnect.getConnection();
		String sql="INSERT INTO monan(tenMonAn,moTa) VALUES(?,?)";
		try {
			PreparedStatement ps =connection.prepareCall(sql);
			ps.setString(1,tenMonAn);
			ps.setString(2, moTa);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Dish> getListDish()
	{
		Connection connection = DBConnect.getConnection();
		String sql="SELECT * FROM monan";
		PreparedStatement ps;
		try {
			ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList<Dish> list = new ArrayList<>();
			while(rs.next())
			{
				Dish dish = new Dish(); 
				dish.setId(rs.getInt("id"));
				dish.setTenMonAn(rs.getString("tenMonAn"));
				
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
