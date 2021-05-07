package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.PagingDTO;

public interface IPBoardService {
	boolean insertBoard(PBoardDTO dto);
	List<PBoardDTO> getAllList();
	PBoardDTO getBoard(int pseq);
	boolean deleteBoard(int pseq);
	boolean updateBoard(PBoardDTO dto);
	boolean mulDel(String[] chk);
	int countBoard();
	List<PBoardDTO> getPagingList(PagingDTO pagingDTO);
}
