package com.luna.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IPBoardDAO;
import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.PagingDTO;
import com.luna.board.dtos.StockDTO;

@Service

public class PBoardService implements IPBoardService{

	@Autowired
	IPBoardDAO PBoardDAO;


	@Override
	public boolean insertBoard(PBoardDTO dto,int[] pnum) {
		// TODO Auto-generated method stub
		return PBoardDAO.insertBoard(dto, pnum);
	}


	@Override
	public List<PBoardDTO> getAllList() {
		// TODO Auto-generated method stub
		return PBoardDAO.getAllList();
	}


	@Override
	public PBoardDTO getBoard(int pseq) {
		// TODO Auto-generated method stub
		return PBoardDAO.getBoard(pseq);
	}


	@Override
	public boolean deleteBoard(int pseq) {
		// TODO Auto-generated method stub
		return PBoardDAO.deleteBoard(pseq);
	}


	@Override
	public boolean updateBoard(PBoardDTO dto) {
		// TODO Auto-generated method stub
		return PBoardDAO.updateBoard(dto);
	}


	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return PBoardDAO.mulDel(chk);
	}


	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return PBoardDAO.countBoard();
	}


	@Override
	public List<PBoardDTO> getPagingList(PagingDTO pagingDTO) {
		// TODO Auto-generated method stub
		return PBoardDAO.getPagingList(pagingDTO);
	}


	@Override
	public Map<String, Object> getDetail(int pseq) {
		// TODO Auto-generated method stub
		return PBoardDAO.getDetail(pseq);
	}


	@Override
	public List<PCategoryDTO> getCategory(String[] chk_arr) {
		// TODO Auto-generated method stub
		return PBoardDAO.getCategory(chk_arr);
	}
}
