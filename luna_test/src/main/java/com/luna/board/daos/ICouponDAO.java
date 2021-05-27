package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.CouponDTO;
import com.luna.board.dtos.RBoardDTO;

public interface ICouponDAO {

	boolean insertCoupon(CouponDTO dto);
	CouponDTO getCoupon(int cseq);
	boolean deleteCoupon(int cseq);
	boolean updateCoupon(CouponDTO dto);
	boolean hitCoupon(CouponDTO dto);
	boolean mulDel(String[] chk);
	CouponDTO ringCoupon();
	List<CouponDTO> getAllList(String id);
	List<CouponDTO> getAllList(CouponDTO dto);
	boolean insertAllCoupon(CouponDTO dto);
	
}
