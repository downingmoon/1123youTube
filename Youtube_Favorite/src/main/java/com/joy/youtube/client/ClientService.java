package com.joy.youtube.client;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.joy.youtube.client.dao.ClientMapper;
import com.joy.youtube.model.GallaryVO;
import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

@Service
public class ClientService {
	
	@Autowired
	private ClientMapper mapper;
	
	@Autowired 
	private BCryptPasswordEncoder bpe;
	
	/*
	 *  Public Method
	 */
	
	public void makeDirectory(File file) {
		if(!file.exists()) {
			file.mkdirs();
		}
	}
	
	
	/*
	 *  Get List
	 */
	
	public List<YoutubeVO> getList() {
		return mapper.getList();
	}
	
	
	/*
	 *  Get Detail
	 */
	
	public YoutubeVO getVideoDetail(int y_no) {
		return mapper.getVideoDetail(y_no);
	}
	
	
	/*
	 *  Join
	 */
	
	public void join(UserVO vo) {
		String encodePassword = bpe.encode(vo.getU_pw());
		vo.setU_pw(encodePassword);
		mapper.join(vo);
	}
	
	
	/*
	 *  Insert Something
	 */
	
	public void insertURL(YoutubeVO vo) {
		mapper.insertURL(vo);
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
		System.out.println("fileName : " + fileName);
		//TODO : fileName은 동일, 이름과 번호(auto increment) DB Insert
		// Bootsnipp에서 gellary
		//큰이미지
		File path = new File(bigImgPath);
		makeDirectory(path);
		File img = new File(bigImgPath, fileName.toLowerCase());
		FileCopyUtils.copy(vo.getImg().getBytes(), img);
		
		//썸네일 경로 생성
		File thumbPath = new File(thumbImgPath);
		makeDirectory(thumbPath);

		System.out.println("bigImgPath : " + bigImgPath);
		System.out.println("thumbImgPath : " + thumbImgPath);
		System.out.println("thumbPath : " + thumbPath);
		System.out.println("Path : " + path);
		
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


//if(!thumbPath.exists()) {
//thumbPath.mkdirs();
//}
