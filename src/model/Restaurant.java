package model;

public class Restaurant {

	private Integer id;
	private String tenQuanAn;
	private String diaChi;
	private Float lat;
	private Float lng;
	private Integer idLoaiQuanAn;
	private String monNoiTieng;
	private String moTa;
	private String hinhAnh;
	private Integer luotTraCuu;
	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Restaurant(Integer id, String tenQuanAn, String diaChi, Float lat, Float lng, Integer idLoaiQuanAn,
			String monNoiTieng, String moTa, String hinhAnh, Integer luotTraCuu) {
		super();
		this.id = id;
		this.tenQuanAn = tenQuanAn;
		this.diaChi = diaChi;
		this.lat = lat;
		this.lng = lng;
		this.idLoaiQuanAn = idLoaiQuanAn;
		this.monNoiTieng = monNoiTieng;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.luotTraCuu = luotTraCuu;
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
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public Float getLat() {
		return lat;
	}
	public void setLat(Float lat) {
		this.lat = lat;
	}
	public Float getLng() {
		return lng;
	}
	public void setLng(Float lng) {
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
	
	
}
