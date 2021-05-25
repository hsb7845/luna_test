package com.luna.board;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.CouponDTO;
import com.luna.board.dtos.RBoardDTO;
import com.luna.board.service.ICouponService;

@Controller
public class CouponController {
	
	@Autowired
	private ICouponService CouponService;
	
	@RequestMapping(value = "/coupon.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String coupon(Locale locale, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String admin = (String)session.getAttribute("admin");
		
		if(admin.equals("관리자")) {
			List<CouponDTO> list = CouponService.getAllList(new CouponDTO());
			model.addAttribute("list",list);
			return "couponList";
			} else {
				List<CouponDTO> list = CouponService.getAllList(new CouponDTO(id));
				model.addAttribute("list",list);
				return "couponList";
			}
		}
		
		
//		List<CouponDTO> list = CouponService.getAllList();
//		model.addAttribute("list",list);
//		
//		return "couponList";
//	}
	
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
		CouponService.hitCoupon(dto);
		System.out.println("cseq"+dto.getCseq());
		model.addAttribute("dto", dto);
		return "couponUpdateForm";
	}
	

	@RequestMapping(value = "/myPage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String ring(Locale locale, Model model) {
		CouponDTO dto = CouponService.ringCoupon();
		model.addAttribute("dto", dto);
		return "myPage";
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
