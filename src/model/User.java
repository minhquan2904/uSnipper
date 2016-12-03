package model;

import java.sql.Date;


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
	private Integer trangThai;
	private Date ngayBlock;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(Integer id, String userName, String pass, String soThich, String tenNguoiDung, Integer quyen,
			String email, String hinhAnh, Date ngayDangKy, Integer trangThai, Date ngayBlock) {
		super();
		this.id = id;
		this.userName = userName;
		this.pass = pass;
		this.soThich = soThich;
		this.tenNguoiDung = tenNguoiDung;
		Quyen = quyen;
		this.email = email;
		this.hinhAnh = hinhAnh;
		this.ngayDangKy = ngayDangKy;
		this.trangThai = trangThai;
		this.ngayBlock = ngayBlock;
	}

	public Integer getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(Integer trangThai) {
		this.trangThai = trangThai;
	}

	public Date getNgayBlock() {
		return ngayBlock;
	}

	public void setNgayBlock(Date ngayBlock) {
		this.ngayBlock = ngayBlock;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSoThich() {
		return soThich;
	}
	public void setSoThich(String soThich) {
		this.soThich = soThich;
	}
	public String getTenNguoiDung() {
		return tenNguoiDung;
	}
	public void setTenNguoiDung(String tenNguoiDung) {
		this.tenNguoiDung = tenNguoiDung;
	}
	public Integer getQuyen() {
		return Quyen;
	}
	public void setQuyen(Integer quyen) {
		Quyen = quyen;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public Date getNgayDangKy() {
		return ngayDangKy;
	}
	public void setNgayDangKy(Date ngayDangKy) {
		this.ngayDangKy = ngayDangKy;
	}
	
	
}
