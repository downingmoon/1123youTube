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
	public void insertGallary(GallaryVO vo) {
		try {
		String contextPath = this.getClass().getClassLoader().getResource("").getPath();
		String fullPath = URLDecoder.decode(contextPath,"UTF-8");
		String pathArr[] = fullPath.split("WEB-INF/classes/");
		String targetPath = pathArr[0] + "resources/img/";
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		String bigImgPath = targetPath + sdf.format(d);
		String thumbImgPath = targetPath + "thumb/" + sdf.format(d);
		System.out.println("sdf.format : " + sdf.format(d));
		UUID uuid = UUID.randomUUID();
		
		String originFileName =  vo.getImg().getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String fileName = uuid.toString() +"." + ext;
		
		//큰이미지
		File path = new File(bigImgPath);
		if(!path.exists()) {
			path.mkdirs();
		}
		File img = new File(bigImgPath, fileName.toLowerCase());
		FileCopyUtils.copy(vo.getImg().getBytes(), img);
		
		//썸네일 경로 생성
		File thumbPath = new File(thumbImgPath);
		if(!thumbPath.exists()) {
			thumbPath.mkdirs();
		}
		System.out.println("bigImgPath : " + bigImgPath);
		System.out.println("thumbImgPath : " + thumbImgPath);
		System.out.println("thumbPath : " + thumbPath);
		System.out.println("Path : " + path);
//		File thumb = new File(thumbImgPath, fileName.toLowerCase());
//		FileCopyUtils.copy(vo.getImg().getBytes(), thumb);
		
		//썸네일 생성
		//IO는 만든 파일을 읽어오는 메소드
		BufferedImage sourceImg = ImageIO.read(img);
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		File thumbImg = new File(thumbImgPath, fileName.toLowerCase());
		ImageIO.write(destImg, ext.toLowerCase(), thumbImg);

		} catch(IOException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
