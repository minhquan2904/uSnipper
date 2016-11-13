package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Connect.DBConnect;
import model.Type;

public class TypeDAO {
	public Type getTypeNameById(Integer id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		
		Connection connection = DBConnect.getConnection();
		String sql ="SELECT * FROM loaiquanan WHERE loaiquanan.id="+id;
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			Type t = new Type();
			if(rs.next())
			{
				t.setId(rs.getInt("id"));
				t.setTenLoai(rs.getString("tenLoai"));
				
				return t;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Type DAO error");
		}
		
		return null;
		
	}
}
