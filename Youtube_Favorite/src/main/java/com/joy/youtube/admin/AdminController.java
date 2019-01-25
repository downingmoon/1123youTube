package com.joy.youtube.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joy.youtube.model.GallaryVO;
import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;

	@RequestMapping("deleteVideo")
	public String deleteVideoGet(int y_no) {
		service.deleteVideo(y_no);
		return "redirect:/client/list";
	}
	
	@RequestMapping("gallaryList")
	public String gallaryList() {
		return "admin/gallaryList";
	}
}
