package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.RBoardDTO;

public interface IRBoardService {
	boolean insertBoard(RBoardDTO dto);
	List<RBoardDTO> getAllList();
	RBoardDTO getBoard(int rseq);
	boolean deleteBoard(int rseq);
	boolean updateBoard(RBoardDTO dto);
	boolean mulDel(String[] chk);
}
