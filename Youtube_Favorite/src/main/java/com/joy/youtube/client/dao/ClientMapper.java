package com.joy.youtube.client.dao;

import java.util.List;

import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

public interface ClientMapper {
	
	public List<YoutubeVO> getList();
	
	public List<YoutubeVO> getMoreVideo(int page);
	
	public YoutubeVO getVideoDetail(int y_no);
	
	public void insertURL(YoutubeVO vo);
	
	public void join(UserVO vo);

}
