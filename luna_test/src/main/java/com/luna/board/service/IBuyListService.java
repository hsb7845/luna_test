package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.BuyListDTO;


public interface IBuyListService {
	boolean insertBoard(BuyListDTO dto);
    List<BuyListDTO> getAllList();
    BuyListDTO getBoard(int bseq);
	boolean deleteBoard(int bseq);
	boolean updateBoard(BuyListDTO dto);
	boolean mulDel(String[] chk);
}
