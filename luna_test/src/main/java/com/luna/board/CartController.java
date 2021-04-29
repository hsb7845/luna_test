package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.CartDTO;
import com.luna.board.service.ICartService;

@Controller
public class CartController {
	
	@Autowired
	private ICartService CartService;
	
	@RequestMapping(value = "/cart.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String cart(Locale locale, Model model) {
		List<CartDTO> list = CartService.getAllList();
		model.addAttribute("list",list);
		
		return "cartList";
	}
	
	@RequestMapping(value = "/cartInsertForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertCart(Locale locale, Model model) {
		return "cartInsertForm";
	}
	
	@RequestMapping(value = "/insertCart.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, CartDTO dto) {
		boolean isS = CartService.insertCart(dto);
		if(isS) {
			return "redirect:cart.do";
		} else {
			model.addAttribute("msg", "장바구니 추가를 실패하였습니다.");
			return "error";
		}
	}	
	
	@RequestMapping(value = "/cartUpdateForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateCart(Locale locale, Model model,int seq) {
		CartDTO dto = CartService.getCart(seq);
		System.out.println("seq"+dto.getSeq());
		model.addAttribute("dto", dto);
		return "cartUpdateForm";
	}
	
	@RequestMapping(value = "/updateCart.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, CartDTO dto) {
		boolean isS = CartService.updateCart(dto);
		if(isS) {
			return "redirect:cart.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/muldelCart.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = CartService.mulDel(chk);
		if(isS) {
			return "redirect:cart.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
	}

}
