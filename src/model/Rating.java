package model;

public class Rating {
	private Integer idNguoiDung;
	private Integer idQuanAn;
	private Integer mucDo;
	public Rating() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rating(Integer idNguoiDung, Integer idQuanAn, Integer mucDo) {
		super();
		this.idNguoiDung = idNguoiDung;
		this.idQuanAn = idQuanAn;
		this.mucDo = mucDo;
	}
	public Integer getIdNguoiDung() {
		return idNguoiDung;
	}
	public void setIdNguoiDung(Integer idNguoiDung) {
		this.idNguoiDung = idNguoiDung;
	}
	public Integer getIdQuanAn() {
		return idQuanAn;
	}
	public void setIdQuanAn(Integer idQuanAn) {
		this.idQuanAn = idQuanAn;
	}
	public Integer getMucDo() {
		return mucDo;
	}
	public void setMucDo(Integer mucDo) {
		this.mucDo = mucDo;
	}
	
	
}
