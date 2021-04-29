package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.ImgFileDTO;
import com.luna.board.service.IImgFileService;

@Controller
public class ImgFileController {

	@Autowired
	private IImgFileService imgFileService;
	
	
	@RequestMapping(value = "/imgfile.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String imgfile(Locale locale, Model model) {
		List<ImgFileDTO> list = imgFileService.getAllList();
		model.addAttribute("list",list);
		
		return "imgfilelist";
	}
	
	@RequestMapping(value = "/insertimgfileform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertboard(Locale locale, Model model) {

		return "imgfileinsertform";
	}
	
	
	
	@RequestMapping(value = "/insertimgfile.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, ImgFileDTO dto) {
		boolean isS = imgFileService.insertBoard(dto);
		if(isS) {
			return "redirect:imgfile.do";
		} else {
			model.addAttribute("msg", "이미지 파일 추가를 실패하였습니다.");
			return "error";
		}
	}
	
	
	@RequestMapping(value = "/updateimgfileForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateboard(Locale locale, Model model,int imgnum) {
		ImgFileDTO dto = imgFileService.getBoard(imgnum);
		System.out.println("filesize"+dto.getFilesize());
		model.addAttribute("dto", dto);
		return "imgfileupdateform";
	}

	@RequestMapping(value = "/updateimgfile.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, ImgFileDTO dto) {
		boolean isS = imgFileService.updateBoard(dto);
		if(isS) {
			return "redirect:imgfile.do";
		} else {
			model.addAttribute("msg","이미지 파일 수정을 실패하였습니다.");
			return "error";
		}

	}
	
	@RequestMapping(value = "/muldelImgfile.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = imgFileService.mulDel(chk);
		if(isS) {
			return "redirect:imgfile.do";
		} else {
			model.addAttribute("msg","이미지 파일 수정을 실패하였습니다.");
			return "error";
		}

	}
}
