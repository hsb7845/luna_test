package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.BuyDetailDTO;

public interface IBuyDetailService {
	boolean insertBoard(BuyDetailDTO dto);
    List<BuyDetailDTO> getAllList();
    BuyDetailDTO getBoard(int bdseq);
	boolean deleteBoard(int bdseq);
	boolean updateBoard(BuyDetailDTO dto);
	boolean mulDel(String[] chk);
}
