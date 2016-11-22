package model;
import java.sql.Timestamp;
import java.util.List;
public class QuanAnTam {
	private int Id;
	private String tenQuanAn;
	private String	diaChi;
	private String monAn;
	private String moTa;
	public QuanAnTam(){
		super();
	}
	public QuanAnTam(int Id,String tenQuanAn, String monAn,String moTa){
		super();
		this.Id=Id;
		this.tenQuanAn=tenQuanAn;
		this.monAn=monAn;
		this.moTa=moTa;	
	}
	public String getDiaChi(){
		return this.diaChi;
	}
	public void setDiaChi(String diaChi){
		this.diaChi=diaChi;
	}
	public Integer getId(){
		return Id;
	}
	public void setId(int Id){
		this.Id=Id;
	}
	public String getTenQuanAn(){
		return tenQuanAn;
	}
	public void setTenQuanAn(String tenQuanAn){
		this.tenQuanAn=tenQuanAn;
	}
	public String getMonAn(){
		return monAn;
	}
	public void setMonAn(String monAn){
		this.monAn=monAn;
	}
	public String getMoTa(){
		return moTa;
	}
	public void setMoTa(String moTa){
		this.moTa=moTa;
	}
}
