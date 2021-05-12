package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.ICartDAO;
import com.luna.board.dtos.CartDTO;

@Service
public class CartService implements ICartService {
	@Autowired
	ICartDAO CartDAO;

	@Override
	public List<CartDTO> getAllList(String id) {
		// TODO Auto-generated method stub
		return CartDAO.getAllList(id);
	}

	@Override
	public boolean insertCart(CartDTO dto) {
		// TODO Auto-generated method stub
		return CartDAO.insertCart(dto);
	}

	@Override
	public CartDTO getCart(int seq) {
		// TODO Auto-generated method stub
		return CartDAO.getCart(seq);
	}

	@Override
	public boolean updateCart(CartDTO dto) {
		// TODO Auto-generated method stub
		return CartDAO.updateCart(dto);
	}
	
	@Override
	public boolean deleteCart(int seq) {
		// TODO Auto-generated method stub
		return CartDAO.deleteCart(seq);
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return CartDAO.mulDel(chk);
	}



}
