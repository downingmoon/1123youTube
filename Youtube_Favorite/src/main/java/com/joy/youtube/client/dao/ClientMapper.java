package com.joy.youtube.client.dao;

import java.util.List;

import com.joy.youtube.model.YoutubeVO;

public interface ClientMapper {
	
	public List<YoutubeVO> getList();
	
	public YoutubeVO getVideoDetail(int y_no);

}
