package com.luna.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IBuyListDAO;
import com.luna.board.dtos.BuyDetailDTO;
import com.luna.board.dtos.BuyListDTO;
import com.luna.board.dtos.CartDTO;
import com.luna.board.dtos.MemberDTO;

@Service
public class BuyListService implements IBuyListService {
	
	
	
	@Autowired
	private IBuyListDAO buyListDAO;
	
	@Override
	public boolean insertBoard(BuyListDTO dto) {
		// TODO Auto-generated method stub
		return buyListDAO.insertBoard(dto);
	}

	@Override
	public List<BuyListDTO> getAllList() {
		// TODO Auto-generated method stub
		return buyListDAO.getAllList();
	}

	@Override
	public BuyListDTO getBoard(int bseq) {
		// TODO Auto-generated method stub
		return buyListDAO.getBoard(bseq);
	}

	@Override
	public boolean deleteBoard(int bseq) {
		// TODO Auto-generated method stub
		return buyListDAO.deleteBoard(bseq);
	}

	@Override
	public boolean updateBoard(BuyListDTO dto) {
		// TODO Auto-generated method stub
		return buyListDAO.updateBoard(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return buyListDAO.mulDel(chk);
	}

	@Override
	public Map<String, Object> getPboard(int pseq) {
		// TODO Auto-generated method stub
		return buyListDAO.getPBoard(pseq);
	}

	@Override
	public MemberDTO getMember(String id) {
		// TODO Auto-generated method stub
		return buyListDAO.getMember(id);
	}

	@Override
	public boolean insertBuyList(BuyListDTO blDTO, List<BuyDetailDTO> list) {
		// TODO Auto-generated method stub
		return buyListDAO.insertBuyList(blDTO,list);
	}

	@Override
	public List<CartDTO> getSelCart(String[] chks,String id) {
		// TODO Auto-generated method stub
		return buyListDAO.getSelCart(chks,id);
	}

	@Override
	public void deleteInCart(String[] chks, String id) {
		// TODO Auto-generated method stub
		buyListDAO.deleteInCart(chks,id);
	}
	
}
