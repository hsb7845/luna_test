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

}
