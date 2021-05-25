package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.CouponDTO;
import com.luna.board.dtos.RBoardDTO;

public interface ICouponService {

	boolean insertCoupon(CouponDTO dto);
	CouponDTO getCoupon(int cseq);
	boolean deleteCoupon(int cseq);
	boolean updateCoupon(CouponDTO dto);
	boolean hitCoupon(CouponDTO dto);
	boolean mulDel(String[] chk);
	CouponDTO ringCoupon();
	List<CouponDTO> getAllList(CouponDTO couponDTO);
}
