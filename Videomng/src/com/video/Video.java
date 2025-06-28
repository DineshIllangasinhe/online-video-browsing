package com.video;

public class Video {
	private int id;
	private String url;
	private String title;
	private String des;
	
	public Video(int id, String url, String title, String des) {
		
		this.id = id;
		this.url = url;
		this.title = title;
		this.des = des;
	}

	public int getId() {
		return id;
	}

	public String getUrl() {
		return url;
	}

	public String getTitle() {
		return title;
	}

	public String getDes() {
		return des;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDes(String des) {
		this.des = des;
	}
	
	
	

}
