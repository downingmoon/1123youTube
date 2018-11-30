package com.joy.youtube.model;

import org.springframework.web.multipart.MultipartFile;

public class GallaryVO {

	private String title;
	private MultipartFile img;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public MultipartFile getImg() {
		return img;
	}

	public void setImg(MultipartFile img) {
		this.img = img;
	}

}
