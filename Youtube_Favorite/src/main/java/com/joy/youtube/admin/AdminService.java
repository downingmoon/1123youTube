package com.joy.youtube.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.joy.youtube.admin.dao.AdminMapper;
import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	@Autowired 
	private BCryptPasswordEncoder bpe;
	
	public void join(UserVO vo) {
		// 보통 서비스 부분에서 로직이 들어감 controller는 연결만 mapper는 dao역할
		//TODO : 비밀번호 암호화
		String encodePassword = bpe.encode(vo.getU_pw());
		vo.setU_pw(encodePassword);
		mapper.join(vo);
	}
	
	public void insertURL(YoutubeVO vo) {
		mapper.insertURL(vo);
	}
	
	public void deleteVideo(int y_no) {
		mapper.deleteVideo(y_no);
	}

}
