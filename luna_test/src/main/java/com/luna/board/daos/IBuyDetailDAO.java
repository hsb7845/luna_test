package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.BuyDetailDTO;


public interface IBuyDetailDAO {
	boolean insertBoard(BuyDetailDTO dto);
    List<BuyDetailDTO> getAllList();
    BuyDetailDTO getBoard(int bdseq);
	boolean deleteBoard(int bdseq);
	boolean updateBoard(BuyDetailDTO dto);
	boolean mulDel(String[] chk);
	
}
