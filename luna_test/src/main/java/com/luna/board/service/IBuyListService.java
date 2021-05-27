package com.luna.board.service;

import java.util.List;
import java.util.Map;

import com.luna.board.dtos.BuyDetailDTO;
import com.luna.board.dtos.BuyListDTO;
import com.luna.board.dtos.CartDTO;
import com.luna.board.dtos.MemberDTO;


public interface IBuyListService {
	boolean insertBoard(BuyListDTO dto);
    List<BuyDetailDTO> getAllList();
    BuyListDTO getBoard(int bseq);
	boolean deleteBoard(int bseq);
	boolean updateBoard(BuyListDTO dto);
	boolean mulDel(String[] chk);
	Map<String, Object> getPboard(int pseq);
	MemberDTO getMember(String id);
	boolean insertBuyList(BuyListDTO blDTO, List<BuyDetailDTO> list);
	List<CartDTO> getSelCart(String[] chks, String id);
	void deleteInCart(String[] chks, String parameter);
	List<BuyDetailDTO> getList(String id);
}
