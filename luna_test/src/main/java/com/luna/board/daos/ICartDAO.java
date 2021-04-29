package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.CartDTO;

public interface ICartDAO {
	List<CartDTO> getAllList();
	boolean insertCart(CartDTO dto);
	CartDTO getCart(int seq);
	boolean deleteCart(int seq);
	boolean updateCart(CartDTO dto);
	boolean mulDel(String[] chk);
}
