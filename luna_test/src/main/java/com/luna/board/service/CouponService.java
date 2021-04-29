package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.ICouponDAO;
import com.luna.board.dtos.CouponDTO;

@Service
public class CouponService implements ICouponService {
	
	@Autowired
	ICouponDAO CouponDAO;

	@Override
	public List<CouponDTO> getAllList() {
		// TODO Auto-generated method stub
		return CouponDAO.getAllList();
	}

	@Override
	public boolean insertCoupon(CouponDTO dto) {
		// TODO Auto-generated method stub
		return CouponDAO.insertCoupon(dto);
	}

	@Override
	public CouponDTO getCoupon(int cseq) {
		// TODO Auto-generated method stub
		return CouponDAO.getCoupon(cseq);
	}

	@Override
	public boolean deleteCoupon(int cseq) {
		// TODO Auto-generated method stub
		return CouponDAO.deleteCoupon(cseq);
	}

	@Override
	public boolean updateCoupon(CouponDTO dto) {
		// TODO Auto-generated method stub
		return CouponDAO.updateCoupon(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return CouponDAO.mulDel(chk);
	}

}
