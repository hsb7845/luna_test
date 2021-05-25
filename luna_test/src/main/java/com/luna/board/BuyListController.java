package com.luna.board;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.BuyListDTO;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.service.IBuyListService;



@Controller
public class BuyListController {
	@Autowired
	private IBuyListService buyListService;
	
	@RequestMapping(value = "/buylist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String getAllBuyList(Locale locale, Model model) {
		List<BuyListDTO> list = buyListService.getAllList();
		model.addAttribute("list",list);
		return "buylist";
	}
	
	@RequestMapping(value = "/buyListInsertForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListInsertForm(Locale locale, Model model) {
		

		return "buyListInsertForm";
	}
	
	@RequestMapping(value = "/buyform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buytForm(Locale locale, Model model,HttpServletRequest request) {
		int pseq =  Integer.parseInt(request.getParameter("pseq"));
		Map<String,Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		JSONParser  parser = new JSONParser();
		try {
			Object obj = parser.parse(request.getParameter("selOpt"));
			JSONObject jsonObj = (JSONObject) obj;
			System.out.println(jsonObj.toJSONString());
			System.out.println("jsonObj.get(1)"+jsonObj.get(1));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		MemberDTO mdto = buyListService.getMember(id);
		map = buyListService.getPboard(pseq);
		model.addAttribute("mdto",mdto);
		model.addAttribute("dto",map.get("dto"));
		model.addAttribute("selOpt",request.getParameter("selOpt"));
		System.out.println(request.getParameter("pseq"));
		System.out.println(request.getParameter("selOpt"));
		return "buyForm";
	}
	
	@RequestMapping(value = "/buyListInsert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListInsert(Locale locale, Model model,BuyListDTO dto) {
		boolean isS = buyListService.insertBoard(dto);
		if(isS) {
			return "redirect:buylist.do";
		}else {
			model.addAttribute("msg","글추가실패");
			return "error";
		}
		
	}
	
	@RequestMapping(value = "/buyListUpdateForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListUpdateForm(Locale locale, Model model,int bseq) {
		BuyListDTO dto = buyListService.getBoard(bseq);
		model.addAttribute("dto",dto);
		return "buyListUpdateForm";
	}
	
	@RequestMapping(value = "/buyListUpdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListUpdate(Locale locale, Model model,BuyListDTO dto) {
		boolean isS = buyListService.updateBoard(dto);
		if(isS) {
			return "redirect:buylist.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
		
	}
	
	@RequestMapping(value = "/buyListDelete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListDelete(Locale locale, Model model,int bseq) {
		boolean isS = buyListService.deleteBoard(bseq);
		if(isS) {
			return "redirect:buylist.do";
		}else {
			model.addAttribute("msg","글삭제실패");
			return "error";
		}
		
	}
	
	
	
	@RequestMapping(value = "/buyListMulDel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListMulDel(Locale locale, Model model,String[] chk) {
		boolean isS = buyListService.mulDel(chk);
		if(isS) {
			return "redirect:buylist.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
		
	}
	
	
}
