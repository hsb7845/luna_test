package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.CouponDTO;

public interface ICouponService {

	List<CouponDTO> getAllList();
	boolean insertCoupon(CouponDTO dto);
	CouponDTO getCoupon(int cseq);
	boolean deleteCoupon(int cseq);
	boolean updateCoupon(CouponDTO dto);
	boolean mulDel(String[] chk);
	

}
