package com.joy.youtube.client.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joy.youtube.model.CommentVO;
import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

public interface ClientMapper {
	
	public List<YoutubeVO> getList();
	
	public List<YoutubeVO> getMoreVideo(int page);
	
	public List<CommentVO> getComment(int y_no);
	
	public int getCommentCount(int y_no);
	
	public void insertComment(@Param("c_writer")String c_writer, 
			@Param("c_content")String c_content, @Param("y_no")int y_no);
	
	public String isYourComment(@Param("y_no")int y_no, @Param("c_no")int c_no);
	
	public void deleteComment(@Param("y_no")int y_no, @Param("c_no")int c_no);
	
	public String getUserNickname(String u_id);
	
	public YoutubeVO getVideoDetail(int y_no);
	
	public void insertURL(YoutubeVO vo);
	
	public void join(UserVO vo);

}
