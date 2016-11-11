package model;

public class Comment {

	private Integer id;
	private String noiDung;
	private Integer idQuanAn;
	private Integer idNguoiDung;
	private String ghiChu;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(Integer id, String noiDung, Integer idQuanAn, Integer idNguoiDung, String ghiChu) {
		super();
		this.id = id;
		this.noiDung = noiDung;
		this.idQuanAn = idQuanAn;
		this.idNguoiDung = idNguoiDung;
		this.ghiChu = ghiChu;
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
	
	
}
