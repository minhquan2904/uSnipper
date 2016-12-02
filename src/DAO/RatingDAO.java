package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Connect.DBConnect;

public class RatingDAO {
	public boolean hasRate(String userName,Integer id)
	{
		Connection conn = DBConnect.getConnection();
		UserDAO dao = new UserDAO();
		Integer uid;
		try {
			uid = dao.findUserByUsn(userName).getId();
			String sql="SELECT * FROM danhgia WHERE idNguoiDung='"+uid+"' and idQuanAn='"+id+"'";
			PreparedStatement ps = conn.prepareCall(sql);
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
	public void insertRate(String userName,Integer id,Integer cur)
	{
		Connection conn = DBConnect.getConnection();
		UserDAO dao = new UserDAO();
		Integer uid;
		try {
			uid = dao.findUserByUsn(userName).getId();
			String sql="INSERT INTO danhgia(idNguoiDung,idQuanAn,mucDo) VALUES(?,?,?)";
			PreparedStatement ps = conn.prepareCall(sql);
			ps.setInt(1, uid); // id nguoi dung
			ps.setInt(2, id); // id quan an
			ps.setInt(3, cur); // muc do
			
			ps.executeUpdate();
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void updateRate(Integer id)
	{
		Connection conn = DBConnect.getConnection();
		String sql="UPDATE quanan "
				+ "SET diemTB = (SELECT AVG(danhgia.mucDo) FROM danhgia WHERE quanan.id=danhgia.idQuanAn),"
				+ "luotDanhGia= (SELECT COUNT(danhgia.mucDo) FROM danhgia WHERE quanan.id = danhgia.idQuanAn)"
				+ " WHERE quanan.id ="+id;
		try {
			PreparedStatement ps = conn.prepareCall(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
