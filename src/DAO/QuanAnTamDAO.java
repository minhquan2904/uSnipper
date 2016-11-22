package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import Connect.DBConnect;
//import dao.UserDAO;
//import connect.DBConnect;
import model.Role;
import model.User;
import model.QuanAnTam;

public class QuanAnTamDAO {
	public boolean insertQuanAnTam(QuanAnTam quan){
		Connection connection=DBConnect.getConnection();
		String sql= "INSERT INTO quanantam (tenquanan,diaChi,mota,monan) VALUES(?,?,?,?)";
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
}
