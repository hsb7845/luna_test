package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.StockDTO;
import com.luna.board.service.IStockService;

public class StockController {
	
	@Autowired
	private  IStockService StockService;

	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(Locale locale, Model model) {

		return "index";
	}
	
	@RequestMapping(value = "/stock.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String rboard(Locale locale, Model model) {
		List<StockDTO> list = StockService.getAllList();
		model.addAttribute("list",list);
		
		return "stockList";
	}
	
	@RequestMapping(value = "/insertStockForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertStock(Locale locale, Model model) {
		return "insertStockForm";
	}
	
	@RequestMapping(value = "/insert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, StockDTO dto) {
		boolean isS = StockService.insertStock(dto);
		if(isS) {
			return "redirect:stock.do";
		} else {
			model.addAttribute("msg", "상품재고 추가를 실패하였습니다.");
			return "error";
		}
	}	
	
	@RequestMapping(value = "/updateStockForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateStock(Locale locale, Model model,int pnum) {
		StockDTO dto = StockService.getStock(pnum);
		System.out.println("pnum"+dto.getPnum());
		model.addAttribute("dto", dto);
		return "stockUpdateForm";
	}
	
	@RequestMapping(value = "/updateStock.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, StockDTO dto) {
		boolean isS = StockService.updateStock(dto);
		if(isS) {
			return "redirect:stock.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/muldel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = StockService.mulDel(chk);
		if(isS) {
			return "redirect:stock.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}

	}

}
