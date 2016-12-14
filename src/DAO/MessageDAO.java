package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connect.DBConnect;
import model.Message;

public class MessageDAO {
	public ArrayList<Message> getlistMessage(Integer id)
	{
		Connection connection=DBConnect.getConnection();
		String sql = "SELECT * FROM thongbao WHERE idNguoiDung = ? and trangThai = 1";
		ArrayList<Message> list = new ArrayList<>();
		try {
			
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				Message ms = new Message();
				ms.setId(rs.getInt("id"));
				ms.setIdViewer(rs.getInt("idNguoiDung"));
				ms.setSender(rs.getString("nguoiGui"));
				ms.setText(rs.getString("noiDung"));
				ms.setStatus(rs.getInt("trangThai"));
				list.add(ms);
			}
			connection.close();
			ps.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	public void sendMessage(Message ms)
	{
		Connection connection=DBConnect.getConnection();
		String sql = "INSERT INTO thongbao(noiDung, nguoiGui, idNguoiDung, trangThai) VALUES (?,?,?,?)";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, ms.getText());
			ps.setString(2, ms.getSender());
			ps.setInt(3, ms.getIdViewer());
			ps.setInt(4, ms.getStatus());
			
			ps.executeUpdate();
			connection.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
