package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.CartDTO;
import com.luna.board.dtos.CouponDTO;
import com.luna.board.dtos.RBoardDTO;

public interface ICouponDAO {
	
	boolean insertCoupon(List<CouponDTO> list);
	CouponDTO getCoupon(int cseq);
	boolean deleteCoupon(int cseq);
	boolean updateCoupon(CouponDTO dto);
	boolean hitCoupon(CouponDTO dto);
	boolean mulDel(String[] chk);
	List<CouponDTO> getAllList(CouponDTO dto);
	boolean insertAllCoup(CouponDTO dto);
	boolean insertEveryCoup(String[] chk);
	CouponDTO ringCoupon(String id);
	
}
