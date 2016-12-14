package model;

public class Message {
	Integer id;
	String text;
	String sender;
	Integer idViewer;
	Integer status;
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Message(Integer id, String text, String sender, Integer idViewer, Integer status) {
		super();
		this.id = id;
		this.text = text;
		this.sender = sender;
		this.idViewer = idViewer;
		this.status = status;
	}

	public Integer getIdViewer() {
		return idViewer;
	}

	public void setIdViewer(Integer idViewer) {
		this.idViewer = idViewer;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}

