package com.joy.youtube.admin.dao;

import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

public interface AdminMapper {
	
	public void join(UserVO vo);
	
	public void insertURL(YoutubeVO vo);
	
	public void deleteVideo(int y_no);

}
