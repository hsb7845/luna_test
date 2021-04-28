package com.luna.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.luna.board.service.ICartService;

@Controller
public class CartController {
	
	@Autowired
	private ICartService CartService;
	
	

}
