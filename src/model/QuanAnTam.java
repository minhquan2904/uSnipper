package model;
import java.sql.Timestamp;
import java.util.List;
public class QuanAnTam {
	private int Id;
	private String tenQuanAn;
	private String	diaChi;
	private String monAn;
	private String moTa;
	private String hinhAnh;
	private Integer trangThai;
	public QuanAnTam(){
		super();
	}
	
	public QuanAnTam(int id, String tenQuanAn, String diaChi, String monAn, String moTa, String hinhAnh,
			Integer trangThai) {
		super();
		Id = id;
		this.tenQuanAn = tenQuanAn;
		this.diaChi = diaChi;
		this.monAn = monAn;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.trangThai = trangThai;
	}
	
	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
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
	public String getMonAn() {
		return monAn;
	}
	public void setMonAn(String monAn) {
		this.monAn = monAn;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public Integer getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(Integer trangThai) {
		this.trangThai = trangThai;
	}
	
}
