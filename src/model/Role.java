package model;

import java.io.Serializable;

public class Role implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;
	private String tenQuyen;
	
	public Role() {
	}

	public int getRoleId() {
		return this.id;
	}

	public void setRoleId(int id) {
		this.id = id;
	}

	public String gettenQuyen() {
		return this.tenQuyen;
	}

	public void settenQuyen(String tenQuyen) {
		this.tenQuyen = tenQuyen;
	}

	

}