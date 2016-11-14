package model;


public class DishInfo {
	private Integer idQuanAn;
	private Integer idMonAn;
	private String hinhAnh;
	private String moTa;
	private Double giaTien;
	public DishInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DishInfo(Integer idQuanAn, Integer idMonAn, String hinhAnh, String moTa, Double giaTien) {
		super();
		this.idQuanAn = idQuanAn;
		this.idMonAn = idMonAn;
		this.hinhAnh = hinhAnh;
		this.moTa = moTa;
		this.giaTien = giaTien;
	}
	public Integer getIdQuanAn() {
		return idQuanAn;
	}
	public void setIdQuanAn(Integer idQuanAn) {
		this.idQuanAn = idQuanAn;
	}
	public Integer getIdMonAn() {
		return idMonAn;
	}
	public void setIdMonAn(Integer idMonAn) {
		this.idMonAn = idMonAn;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public Double getGiaTien() {
		return giaTien;
	}
	public void setGiaTien(Double giaTien) {
		this.giaTien = giaTien;
	}
	
	
	
}
