package com.joy.youtube.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joy.youtube.model.CommentVO;
import com.joy.youtube.model.GallaryVO;
import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

@Controller
@RequestMapping("client") //슬래쉬 넣을필요 없음
public class ClientController {
	@Autowired
	private ClientService service;
	
	@RequestMapping("jsonList")
	@ResponseBody
	public List<YoutubeVO> jsonList() {
		List<YoutubeVO> list = service.getList();
		return list;
	}
	
	@RequestMapping("getMoreVideoAjax")
	@ResponseBody
	public List<YoutubeVO> getMoreVideoAjax(int page) {
		System.out.println("page : " + page );
		List<YoutubeVO> list = service.getMoreVideo(page);
		return list;
	}
	
	@RequestMapping("commentAjax")
	@ResponseBody
	public void insertComment(int y_no, String c_content, String c_writer) {
		System.out.println("y_no : " + y_no + "|| c_content : " + c_content + "|| c_writer : " + c_writer);
		service.insertComment(y_no, c_content, c_writer);
		
	}
	
	@RequestMapping("authCheckAjax")
	@ResponseBody
	public boolean authCheck(String nick, int c_no, int y_no) {
		boolean result = service.isYourComment(nick, y_no, c_no);
		return result;
	}
	
	@RequestMapping("deleteCommentAjax")
	@ResponseBody
	public void deleteComment(int y_no, int c_no) {
		service.deleteComment(y_no, c_no);
	}
	
	@RequestMapping("list")
	public String list(Model model) {
		List<YoutubeVO> list = service.getList();
		model.addAttribute("list",list);
		model.addAttribute("target", "client/list");
		return "template";
	}
	
	@RequestMapping("playVideo")
	public String getVideoDetail(int y_no, Model m, String u_id) {
		System.out.println("uid : " + u_id);
		YoutubeVO vo = service.getVideoDetail(y_no);
		List<CommentVO> list = service.getComment(y_no);
		int cnt = service.getCommentCount(y_no);
		String nickname = service.getUserNickname(u_id);
		System.out.println("nickname : " + nickname);
		m.addAttribute("list", list);
		m.addAttribute("count", cnt);
		m.addAttribute("y_no", y_no);
		m.addAttribute("vo",vo);
		m.addAttribute("nick", nickname);
		m.addAttribute("target","client/playVideo");
		return "template";
	}
	
	@RequestMapping("insertURL")
	public String insertURLGet(Model m) {
		m.addAttribute("target","client/insertURL");
		return "template";
	}
	@RequestMapping(value="insertURL", method=RequestMethod.POST)
	public String insertURLPost(YoutubeVO vo) {
		service.insertURL(vo);
		return "redirect:/client/list";
	}
	
//	@RequestMapping("insertGallary")
//	public String insertGallaryGet(Model m) {
//		m.addAttribute("target", "client/insertGallary");
//		return "template";
//	}
//	@RequestMapping(value="insertGallary", method=RequestMethod.POST)
//	public String insertGallaryPost(GallaryVO vo, Model m) {
//		service.insertGallary(vo);
//		m.addAttribute("target", "client/galleryList");
//		return "template";
//	}
	
	@RequestMapping("join")
	public String joinGet(Model m) {
		m.addAttribute("target", "login/joinForm");
		return "template";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinPost(UserVO vo) {
		System.out.println("joinPost / name : " + vo.getU_name());
		service.join(vo);
		return "redirect:/client/list";
		
	}
	
	@RequestMapping("gallery")
	public String getGalleryList(Model m) {
		m.addAttribute("title", "client/gallery");
		return "template";
	}

}
