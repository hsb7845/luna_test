package com.luna.board.daos;

import java.util.List;
import java.util.Map;

import com.luna.board.dtos.BuyDetailDTO;
import com.luna.board.dtos.BuyListDTO;
import com.luna.board.dtos.CartDTO;
import com.luna.board.dtos.MemberDTO;

public interface IBuyListDAO {
	boolean insertBoard(BuyListDTO dto);
    List<BuyDetailDTO> getAllList();
    BuyListDTO getBoard(int bseq);
	boolean deleteBoard(int bseq);
	boolean updateBoard(BuyListDTO dto);
	boolean mulDel(String[] chk);
	Map<String, Object> getPBoard(int pseq);
	MemberDTO getMember(String id);
	boolean insertBuyList(BuyListDTO blDTO, List<BuyDetailDTO> list);
	List<CartDTO> getSelCart(String[] chks, String id);
	void deleteInCart(String[] chks, String id);
	List<BuyDetailDTO> getList(String id);
}
