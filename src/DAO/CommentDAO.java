package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connect.*;
import model.Comment;
import model.User;

public class CommentDAO {
	UserDAO udao = new UserDAO();
	
	public ArrayList<Comment> loadCommentByRtsId(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		String sql="SELECT * FROM nhanxet WHERE nhanxet.idQuanAn ="+id+" ORDER BY id DESC";
		
		try {
			
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList<Comment> list= new ArrayList<>();
			while(rs.next())
			{
				Comment cm = new Comment();
				
				cm.setId(rs.getInt("id"));
				cm.setNoiDung(rs.getString("noiDung"));
				cm.setIdQuanAn(rs.getInt("idQuanAn"));
				cm.setNgayThem(rs.getDate("ngayThem"));
				cm.setIdNguoiDung(rs.getInt("idNguoiDung"));
				cm.setGhiChu(rs.getString("ghiChu"));
				User user = udao.findUserById(rs.getInt("idNguoiDung"));
				cm.setUser(user);
				
				list.add(cm);
			}
			
			
			return list;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
		
	}
}
