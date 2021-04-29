package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.BuyDetailDTO;
import com.luna.board.service.IBuyDetailService;



@Controller
public class BuyDetailController {
	@Autowired
	private IBuyDetailService buyDetailService;
	
	@RequestMapping(value = "/buyDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String getAllBuyDetail(Locale locale, Model model) {
		List<BuyDetailDTO> list = buyDetailService.getAllList();
		model.addAttribute("list",list);
		return "buyDetail";
	}
	
	@RequestMapping(value = "/buyDetailInsertForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyDetailInsertForm(Locale locale, Model model) {
		

		return "buyDetailInsertForm";
	}
	
	@RequestMapping(value = "/buyDetailInsert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyDetailInsert(Locale locale, Model model,BuyDetailDTO dto) {
		boolean isS = buyDetailService.insertBoard(dto);
		if(isS) {
			return "redirect:buyDetail.do";
		}else {
			model.addAttribute("msg","글추가실패");
			return "error";
		}
		
	}
	
	@RequestMapping(value = "/buyDetailUpdateForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyDetailUpdateForm(Locale locale, Model model,int bseq) {
		BuyDetailDTO dto = buyDetailService.getBoard(bseq);
		model.addAttribute("dto",dto);
		return "buyDetailUpdateForm";
	}
	
	@RequestMapping(value = "/buyDetailUpdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyDetailUpdate(Locale locale, Model model,BuyDetailDTO dto) {
		boolean isS = buyDetailService.updateBoard(dto);
		if(isS) {
			return "redirect:buyDetail.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
		
	}
	
	@RequestMapping(value = "/buyDetailDelete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyDetailDelete(Locale locale, Model model,int bseq) {
		boolean isS = buyDetailService.deleteBoard(bseq);
		if(isS) {
			return "redirect:buyDetail.do";
		}else {
			model.addAttribute("msg","글삭제실패");
			return "error";
		}
		
	}
	
	
	
	@RequestMapping(value = "/buyDetailMulDel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyDetailMulDel(Locale locale, Model model,String[] chk) {
		boolean isS = buyDetailService.mulDel(chk);
		if(isS) {
			return "redirect:buyDetail.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
		
	}
	
	
}
