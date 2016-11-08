package model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class User {
	private Integer id;
	private String userName;
	private String pass;
	private String soThich;
	private String tenNguoiDung;
	private Integer Quyen;
	private String email;
	private String hinhAnh;
	private Date ngayDangKy;
	
	public User() {
		super();
	}
	
	public User(Integer id,String userName,String pass,String soThich,String tenNguoiDung,Integer Quyen,String email,String hinhAnh,Date ngayDangKy) {
		super();
		
		this.id = id;
		this.email = email;
		this.tenNguoiDung= tenNguoiDung;
		this.userName = userName;
		this.pass = pass;
		this.Quyen = Quyen;
		this.soThich = soThich;
		this.hinhAnh = hinhAnh;
		this.ngayDangKy = ngayDangKy;
	}
	//
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	//
	public String gethinhAnh()
	{
		return hinhAnh;
	}
	public void sethinhAnh(String hinhAnh)
	{
		this.hinhAnh = hinhAnh;
	}
	// 
	public Date getngayDangKy()
	{
		return ngayDangKy;
	}
	public void setngayDangKy(Date ngayDangKy)
	{
		this.ngayDangKy = ngayDangKy;
	}
	//
	public Integer getQuyen() {
		return Quyen;
	}
	public void setQuyen(Integer Quyen) {
		this.Quyen = Quyen;
	}
	//
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	//
	public String gettenNguoiDung() {
		return tenNguoiDung;
	}
	public void settenNguoiDung(String tenNguoiDung) {
		this.tenNguoiDung = tenNguoiDung;
	}
	//
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	//
	public String getsoThich() {
		return soThich;
	}
	public void setsoThich(String soThich) {
		this.soThich = soThich;
	}
	//
	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
}
