package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.CouponDTO;

public interface ICouponDAO {

	List<CouponDTO> getAllList();
	boolean insertCoupon(CouponDTO dto);
	CouponDTO getCoupon(int cseq);
	boolean deleteCoupon(int cseq);
	boolean updateCoupon(CouponDTO dto);
	boolean hitCoupon(CouponDTO dto);
	boolean mulDel(String[] chk);
	
}
