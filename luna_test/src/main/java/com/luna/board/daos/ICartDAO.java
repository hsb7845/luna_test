package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.CartDTO;

public interface ICartDAO {
	List<CartDTO> getAllList();
}
