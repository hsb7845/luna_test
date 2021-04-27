package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.PBoardDTO;

public interface IPBoardService {
	boolean insertBoard(PBoardDTO dto);
	List<PBoardDTO> getAllList();
	PBoardDTO getBoard(int pseq);
	boolean deleteBoard(int pseq);
	boolean updateBoard(PBoardDTO dto);
}
