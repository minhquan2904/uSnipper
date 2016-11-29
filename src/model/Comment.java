package model;

import java.sql.Date;

public class Comment {

	private Integer id;
	private String noiDung;
	private Integer idQuanAn;
	private Integer idNguoiDung;
	private String ghiChu;
	private Date ngayThem;
	private User user;
	private Integer trangThai;
	
	
	
	public Comment(Integer id, String noiDung, Integer idQuanAn, Integer idNguoiDung, String ghiChu, Date ngayThem,
			User user, Integer trangThai) {
		super();
		this.id = id;
		this.noiDung = noiDung;
		this.idQuanAn = idQuanAn;
		this.idNguoiDung = idNguoiDung;
		this.ghiChu = ghiChu;
		this.ngayThem = ngayThem;
		this.user = user;
		this.trangThai = trangThai;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Integer getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(Integer trangThai) {
		this.trangThai = trangThai;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	public Integer getIdQuanAn() {
		return idQuanAn;
	}
	public void setIdQuanAn(Integer idQuanAn) {
		this.idQuanAn = idQuanAn;
	}
	public Integer getIdNguoiDung() {
		return idNguoiDung;
	}
	public void setIdNguoiDung(Integer idNguoiDung) {
		this.idNguoiDung = idNguoiDung;
	}
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	public Date getNgayThem() {
		return ngayThem;
	}
	public void setNgayThem(Date ngayThem) {
		this.ngayThem = ngayThem;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
