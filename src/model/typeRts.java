package model;

public class typeRts {
	private Integer id;
	private String tenLoai;
	public typeRts() {
		super();
		// TODO Auto-generated constructor stub
	}
	public typeRts(Integer id, String tenLoai) {
		super();
		this.id = id;
		this.tenLoai = tenLoai;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTenLoai() {
		return tenLoai;
	}
	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}
	
	
}
