package model;


public class DishInfo {
	private Integer idQuanAn;
	private Integer idMonAn;
	private String hinhAnh;
	private String moTa;
	private Integer giaTien;
	private Dish dishId;
	public DishInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DishInfo(Integer idQuanAn, Integer idMonAn, String hinhAnh, String moTa, Integer giaTien, Dish dishId) {
		super();
		this.idQuanAn = idQuanAn;
		this.idMonAn = idMonAn;
		this.hinhAnh = hinhAnh;
		this.moTa = moTa;
		this.giaTien = giaTien;
		this.dishId = dishId;
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
	public Integer getGiaTien() {
		return giaTien;
	}
	public void setGiaTien(Integer giaTien) {
		this.giaTien = giaTien;
	}
	public Dish getDishId() {
		return dishId;
	}
	public void setDishId(Dish dishId) {
		this.dishId = dishId;
	}

	
	
	
}
