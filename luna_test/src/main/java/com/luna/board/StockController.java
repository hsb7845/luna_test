package com.luna.board;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.mybatis.logging.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.StockDTO;
import com.luna.board.service.IStockService;
import com.luna.board.service.PCategoryService;

@Controller
public class StockController {
	
	@Autowired
	private  IStockService StockService;


	
	@RequestMapping(value = "/stock.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String stock(Locale locale, Model model) {
		List<StockDTO> list = StockService.getAllList();
		model.addAttribute("list",list);
		
		return "stockList";
	}
	
	@RequestMapping(value = "/stockInsertForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertStock(Locale locale, Model model) {
		return "stockInsertForm";
	}
	
	@RequestMapping(value = "/insertStock.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, StockDTO dto,PCategoryDTO cdto) {
		int cnum = StockService.getCnum(cdto);
		dto.setCnum(cnum);
		boolean isS = StockService.insertStock(dto);
		if(isS) {
			return "redirect:stock.do";
		} else {
			model.addAttribute("msg", "상품재고 추가를 실패하였습니다.");
			return "error";
		}
	}	
	
	@RequestMapping(value = "/stockUpdateForm.do", method = {RequestMethod.GET,RequestMethod.POST})
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
	
	@RequestMapping(value = "/muldelStock.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = StockService.mulDel(chk);
		if(isS) {
			return "redirect:stock.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}

	}
	
	@RequestMapping(value = "/stockForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String stockInsert(Locale locale, Model model) {
		
		List<String> list = StockService.getPtype();
		model.addAttribute("list",list);
		return "stockForm";
	}	
	
	@RequestMapping(value = "/stockInsert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert1(Locale locale, Model model, StockDTO dto) {
		boolean isS = StockService.stockInsert(dto);
		if(isS) {
			return "redirect:stock.do";
		} else {
			model.addAttribute("msg", "상품재고 추가를 실패하였습니다.");
			return "error";
		}
	}	
	
	@ResponseBody
	@RequestMapping(value = "/getColor.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,List<PCategoryDTO>>getColor(Locale locale, Model model,String ptype) {
		Map<String,List<PCategoryDTO>> map = new HashMap<String, List<PCategoryDTO>>();
		List<PCategoryDTO> list = StockService.getColor(ptype);
		map.put("list", list); 
		System.out.println("list.size"+list.size());
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/getSize.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,List<PCategoryDTO>>getSize(Locale locale, Model model,String ptype) {
		Map<String,List<PCategoryDTO>> map = new HashMap<String, List<PCategoryDTO>>();
		List<PCategoryDTO> list = StockService.getSize(ptype);
		map.put("list", list); 
		System.out.println("list.size"+list.size());
		return map;
	}

}
