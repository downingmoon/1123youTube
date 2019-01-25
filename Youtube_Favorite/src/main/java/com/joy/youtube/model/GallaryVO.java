package com.joy.youtube.model;

import org.springframework.web.multipart.MultipartFile;

public class GallaryVO {

	private int g_no;
	private String g_filename;
	private String g_title;
	private MultipartFile img;

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public String getG_filename() {
		return g_filename;
	}

	public void setG_filename(String g_filename) {
		this.g_filename = g_filename;
	}

	public String getG_title() {
		return g_title;
	}

	public void setG_title(String g_title) {
		this.g_title = g_title;
	}

	public String getGtitle() {
		return g_title;
	}

	public void setGtitle(String g_title) {
		this.g_title = g_title;
	}

	public MultipartFile getImg() {
		return img;
	}

	public void setImg(MultipartFile img) {
		this.img = img;
	}

}
