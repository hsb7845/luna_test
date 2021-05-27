package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.CartDTO;

public interface ICartService {

	List<CartDTO> getAllList(String id);
	boolean insertCart(List<CartDTO> list);
	CartDTO getCart(int seq);
	boolean deleteCart(int seq);
	boolean updateCart(CartDTO dto);
	boolean mulDel(String[] chk);

}
