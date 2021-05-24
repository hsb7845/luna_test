package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.QBoardDTO;

public interface IQBoardService {

	List<QBoardDTO> getAllList();

	boolean insertBoard(QBoardDTO dto);

	QBoardDTO getBoard(int qseq);

	boolean deleteBoard(int qseq);

	boolean updateBoard(QBoardDTO dto);

	boolean mulDel(String[] chk);

	boolean insertReply(QBoardDTO dto);

}
