package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import Connect.DBConnect;
import model.Dish;
public class DishDAO {
	public Dish getDishById(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		Dish dish = new Dish();
		
		String sql = "SELECT * from monan WHERE id="+id;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				dish.setId(rs.getInt("id"));
				dish.setMoTa(rs.getString("moTa"));
				dish.setTenMonAn(rs.getString("tenMonAn"));
				ps.close();
				return dish;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
}
