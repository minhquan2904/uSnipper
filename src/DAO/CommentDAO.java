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
		String sql="SELECT * FROM nhanxet WHERE nhanxet.idQuanAn ="+id+" and nhanxet.trangThai=1 ORDER BY id DESC";
		
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
	public ArrayList<Comment> loadWaitCommentByRtsId(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		String sql="SELECT * FROM nhanxet WHERE nhanxet.idQuanAn ="+id+" and nhanxet.trangThai=0 ";
		
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
	public ArrayList<Comment> loadAllCommentByRtsId(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		String sql="SELECT * FROM nhanxet WHERE nhanxet.idQuanAn ="+id+" and ORDER BY id DESC";
		
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
	public void insertComment(Integer idQuanAn,Integer idNguoiDung,String noiDung)
	{
		Connection connection = DBConnect.getConnection();
		String sql="INSERT INTO nhanxet(noiDung,idQuanAn,idNguoiDung,ngayThem,trangThai) VALUES(?,?,?,CURDATE(),0)";
		
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			
			ps.setString(1, noiDung);
			ps.setInt(2, idQuanAn);
			ps.setInt(3, idNguoiDung);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void updateStatus(Integer id,Integer status)
	{
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE nhanxet SET trangThai = '"+status+"' WHERE nhanxet.id = '"+id+"' ";
		try {
			PreparedStatement ps = connection.prepareCall(sql);		
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public Boolean deleteComment(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		String sql=" DELETE FROM nhanxet WHERE id="+id;
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	public Comment findCommentById(Integer id)
	{
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM nhanxet WHERE id=? ";
		Comment cm = new Comment();
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				cm.setId(rs.getInt("id"));
				cm.setNoiDung(rs.getString("noiDung"));
				cm.setIdQuanAn(rs.getInt("idQuanAn"));
				cm.setNgayThem(rs.getDate("ngayThem"));
				cm.setIdNguoiDung(rs.getInt("idNguoiDung"));
				cm.setGhiChu(rs.getString("ghiChu"));
				User user = udao.findUserById(rs.getInt("idNguoiDung"));
				cm.setUser(user);
			}
			connection.close();
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cm;
	}
}
