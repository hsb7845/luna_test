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
	public List<CartDTO> getAllList() {
		// TODO Auto-generated method stub
		return null;
	}

}
