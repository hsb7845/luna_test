package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.service.IPCategoryService;

@Controller
public class PCategoryController {
	
	@Autowired
	private IPCategoryService pCategoryService;
	
	@RequestMapping(value = "/pcategory.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pcategory(Locale locale, Model model) {
		List<PCategoryDTO> list = pCategoryService.getAllList();
		model.addAttribute("list",list);
		
		return "pcategorylist";
	}
	
	@RequestMapping(value = "/insertpcategoryform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertboard(Locale locale, Model model) {

		return "pcategoryinsertform";
	}
	
	
	
	@RequestMapping(value = "/insertpcategory.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, PCategoryDTO dto) {
		boolean isS = pCategoryService.insertBoard(dto);
		if(isS) {
			return "redirect:pcategory.do";
		} else {
			model.addAttribute("msg", "상품 분류 글 추가를 실패하였습니다.");
			return "error";
		}
	}
	
	
	@RequestMapping(value = "/updatepcategoryForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateboard(Locale locale, Model model,int cnum) {
		PCategoryDTO dto = pCategoryService.getBoard(cnum);
		System.out.println("ptype"+dto.getPtype());
		model.addAttribute("dto", dto);
		return "pcategoryupdateform";
	}

	@RequestMapping(value = "/updatepcategory.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, PCategoryDTO dto) {
		boolean isS = pCategoryService.updateBoard(dto);
		if(isS) {
			return "redirect:pcategory.do";
		} else {
			model.addAttribute("msg","상품 분류 글 수정을 실패하였습니다.");
			return "error";
		}

	}
	
	@RequestMapping(value = "/muldelPcategory.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = pCategoryService.mulDel(chk);
		if(isS) {
			return "redirect:eboard.do";
		} else {
			model.addAttribute("msg","상품 분류 글 수정을 실패하였습니다.");
			return "error";
		}
	}
}
