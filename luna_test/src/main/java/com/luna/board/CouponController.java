package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.CouponDTO;
import com.luna.board.service.ICouponService;

@Controller
public class CouponController {
	
	@Autowired
	private ICouponService CouponService;
	
	@RequestMapping(value = "/coupon.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String coupon(Locale locale, Model model) {
		List<CouponDTO> list = CouponService.getAllList();
		model.addAttribute("list",list);
		
		return "couponList";
	}
	

}
