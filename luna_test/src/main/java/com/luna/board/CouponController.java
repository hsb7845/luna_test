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
	
	@RequestMapping(value = "/couponInsertForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertCoupon(Locale locale, Model model) {
		return "couponInsertForm";
	}
	
	@RequestMapping(value = "/insertCoupon.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, CouponDTO dto) {
		boolean isS = CouponService.insertCoupon(dto);
		if(isS) {
			return "redirect:coupon.do";
		} else {
			model.addAttribute("msg", "장바구니 추가를 실패하였습니다.");
			return "error";
		}
	}	
	
	@RequestMapping(value = "/couponUpdateForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateCoupon(Locale locale, Model model,int cseq) {
		CouponDTO dto = CouponService.getCoupon(cseq);
		System.out.println("cseq"+dto.getCseq());
		model.addAttribute("dto", dto);
		return "couponUpdateForm";
	}
	
	@RequestMapping(value = "/updateCoupon.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, CouponDTO dto) {
		boolean isS = CouponService.updateCoupon(dto);
		if(isS) {
			return "redirect:coupon.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
	}
	
	
	
	
	@RequestMapping(value = "/muldelCoupon.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = CouponService.mulDel(chk);
		if(isS) {
			return "redirect:coupon.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
	}

}
