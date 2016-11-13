package model;

import java.sql.Date;

public class Restaurant {

	private Integer id;
	private String tenQuanAn;
	private Integer soNha;
	private String tenDuong;
	private String tenPhuong;
	private String tenQuan;
	private String lat;
	private String lng;
	private Integer idLoaiQuanAn;
	private String monNoiTieng;
	private String moTa;
	private String hinhAnh;
	private Integer luotTraCuu;
	private Date ngayThem;
	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Restaurant(Integer id, String tenQuanAn, Integer soNha, String tenDuong, String tenPhuong, String tenQuan,
			String lat, String lng, Integer idLoaiQuanAn, String monNoiTieng, String moTa, String hinhAnh,
			Integer luotTraCuu, Date ngayThem) {
		super();
		this.id = id;
		this.tenQuanAn = tenQuanAn;
		this.soNha = soNha;
		this.tenDuong = tenDuong;
		this.tenPhuong = tenPhuong;
		this.tenQuan = tenQuan;
		this.lat = lat;
		this.lng = lng;
		this.idLoaiQuanAn = idLoaiQuanAn;
		this.monNoiTieng = monNoiTieng;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.luotTraCuu = luotTraCuu;
		this.ngayThem = ngayThem;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTenQuanAn() {
		return tenQuanAn;
	}
	public void setTenQuanAn(String tenQuanAn) {
		this.tenQuanAn = tenQuanAn;
	}
	public Integer getSoNha() {
		return soNha;
	}
	public void setSoNha(Integer soNha) {
		this.soNha = soNha;
	}
	public String getTenDuong() {
		return tenDuong;
	}
	public void setTenDuong(String tenDuong) {
		this.tenDuong = tenDuong;
	}
	public String getTenPhuong() {
		return tenPhuong;
	}
	public void setTenPhuong(String tenPhuong) {
		this.tenPhuong = tenPhuong;
	}
	public String getTenQuan() {
		return tenQuan;
	}
	public void setTenQuan(String tenQuan) {
		this.tenQuan = tenQuan;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public Integer getIdLoaiQuanAn() {
		return idLoaiQuanAn;
	}
	public void setIdLoaiQuanAn(Integer idLoaiQuanAn) {
		this.idLoaiQuanAn = idLoaiQuanAn;
	}
	public String getMonNoiTieng() {
		return monNoiTieng;
	}
	public void setMonNoiTieng(String monNoiTieng) {
		this.monNoiTieng = monNoiTieng;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public Integer getLuotTraCuu() {
		return luotTraCuu;
	}
	public void setLuotTraCuu(Integer luotTraCuu) {
		this.luotTraCuu = luotTraCuu;
	}
	public Date getNgayThem() {
		return ngayThem;
	}
	public void setNgayThem(Date ngayThem) {
		this.ngayThem = ngayThem;
	}
	
	
	
}
