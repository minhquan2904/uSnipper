package model;

public class Type {
	private Integer id;
	private String tenLoai;
	public Type() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Type(Integer id, String tenLoai) {
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
