package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connect.DBConnect;
import model.Restaurant;

public class LocationDAO {
	public Double calLocation(Double lat1,Double lng1,Double lat2,Double lng2)
	{



	    Double circumference = 40000.0; // Earth's circumference at the equator in km
	    Double distance = 0.0;
	   
	    Double latitude1Rad = Math.toRadians(lat1);
	    Double longitude1Rad = Math.toRadians(lng1);
	    Double latititude2Rad =  Math.toRadians(lat2);
	    Double longitude2Rad = Math.toRadians(lng2);
	    
	    Double logitudeDiff = Math.abs(longitude1Rad-longitude2Rad);
	    
	    if(logitudeDiff > Math.PI)
	    {
	    	 logitudeDiff = 2.0 * Math.PI - logitudeDiff;
	    }

        double angleCalculation =
            Math.acos(
              Math.sin(latititude2Rad) * Math.sin(latitude1Rad) +
              Math.cos(latititude2Rad) * Math.cos(latitude1Rad) * Math.cos(logitudeDiff));
        distance = circumference * angleCalculation / (2.0 * Math.PI);
        
        return distance;
	}
	public ArrayList<Restaurant> getListNearBy(Double lat,Double lng)
	{

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {			
			System.out.println("can not load jdbc Driver !");
		}
		
		Connection connection=DBConnect.getConnection();
		ArrayList<Restaurant> list = new ArrayList<>();
		String sql="SELECT * FROM quanan";
		
		try {
			PreparedStatement ps;
			ps = connection.prepareCall(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Restaurant rts = new Restaurant();	
				rts.setId(rs.getInt("id"));
				rts.setTenQuanAn(rs.getString("tenQuanAn"));
				rts.setSoNha(rs.getInt("soNha"));
				rts.setTenDuong(rs.getString("tenDuong"));
				rts.setTenPhuong(rs.getString("tenPhuong"));
				rts.setTenQuan(rs.getString("tenQuan"));
				rts.setHinhAnh(rs.getString("hinhAnh"));
				rts.setMonNoiTieng(rs.getString("monNoiTieng"));
				rts.setIdLoaiQuanAn(rs.getInt("idLoaiQuanAn"));
				rts.setLat(rs.getString("lat"));
				rts.setLng(rs.getString("lng"));
				rts.setLuotTraCuu(rs.getInt("luotTraCuu"));
				rts.setMoTa(rs.getString("moTa"));
				rts.setNgayThem(rs.getDate("ngayThem"));
				rts.setDiemTB(rs.getFloat("diemTB"));
				rts.setLuotDanhGia(rs.getInt("luotDanhGia"));
				list.add(rts);
			}
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Restaurant> finalList = new ArrayList<>();
		Double temp = 0.0;
		
		for(int i=0;i<list.size();i++)
		{
			Double lat2 = Double.parseDouble(list.get(i).getLat()) ;
			Double lng2 = Double.parseDouble(list.get(i).getLng());
			temp=calLocation(lat, lng,lat2, lng2);		
			if(temp <= 0.5)		{
				finalList.add(list.get(i));
			}
				
		}
		System.out.println("There are : " + finalList.size());
		return finalList;
	}
}
