package com.joy.youtube.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.joy.youtube.admin.dao.AdminMapper;
import com.joy.youtube.model.GallaryVO;
import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public void deleteVideo(int y_no) {
		mapper.deleteVideo(y_no);
	}
	

}
