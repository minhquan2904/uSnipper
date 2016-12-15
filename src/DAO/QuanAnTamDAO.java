package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connect.DBConnect;
//import dao.UserDAO;
//import connect.DBConnect;

import model.QuanAnTam;

public class QuanAnTamDAO {
	public boolean insertQuanAnTam(QuanAnTam quan){
		Connection connection=DBConnect.getConnection();
		String sql= "INSERT INTO quanantam (tenquanan,diaChi,mota,monan,trangThai) VALUES(?,?,?,?,1)";
		try {
            PreparedStatement ps = (PreparedStatement)connection.prepareCall(sql);         
            ps.setString(1, quan.getTenQuanAn());	          
            ps.setString(2, quan.getDiaChi());
            ps.setString(3, quan.getMoTa());
            ps.setString(4,quan.getMonAn());	            
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (SQLException ex) {
          //  Logger.getLogger(QuanAnTamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
		return false;
	}
	
	public ArrayList<QuanAnTam> getlistTemp()
	{
		Connection connection=DBConnect.getConnection();
		String sql="SELECT * FROM quanantam";
		ArrayList<QuanAnTam> list = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				QuanAnTam temp = new QuanAnTam();
				temp.setId(rs.getInt("id"));
				temp.setDiaChi(rs.getString("diaChi"));
				temp.setTenQuanAn(rs.getString("tenQuanAn"));
				temp.setMoTa(rs.getString("moTa"));
				temp.setHinhAnh(rs.getString("hinhAnh"));
				temp.setMonAn(rs.getString("monAn"));
				temp.setTrangThai(rs.getInt("trangThai"));
				
				list.add(temp);
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
	public QuanAnTam findTempById(Integer id)
	{
		Connection connection=DBConnect.getConnection();
		String sql="SELECT * FROM quanantam WHERE id =?";
		QuanAnTam temp = new QuanAnTam();
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				
				temp.setId(rs.getInt("id"));
				temp.setDiaChi(rs.getString("diaChi"));
				temp.setTenQuanAn(rs.getString("tenQuanAn"));
				temp.setMoTa(rs.getString("moTa"));
				temp.setHinhAnh(rs.getString("hinhAnh"));
				temp.setMonAn(rs.getString("monAn"));
				temp.setTrangThai(rs.getInt("trangThai"));
			}
			connection.close();
			ps.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;
	}
}
