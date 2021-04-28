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

}
