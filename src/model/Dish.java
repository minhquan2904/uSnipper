package model;

public class Dish {

		private Integer id;
		private String tenMonAn;
		private String moTa;
		
		public Dish(Integer id, String tenMonAn, String moTa) {
			super();
			this.id = id;
			this.tenMonAn = tenMonAn;
			this.moTa = moTa;
		}
		public Dish() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getTenMonAn() {
			return tenMonAn;
		}

		public void setTenMonAn(String tenMonAn) {
			this.tenMonAn = tenMonAn;
		}

		public String getMoTa() {
			return moTa;
		}

		public void setMoTa(String moTa) {
			this.moTa = moTa;
		}

		
		
		
}
