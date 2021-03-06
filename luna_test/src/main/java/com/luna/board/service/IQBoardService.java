package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.QBoardDTO;
import com.luna.board.dtos.RBoardDTO;

public interface IQBoardService {

	List<QBoardDTO> getAllList(QBoardDTO dto);

	boolean insertBoard(QBoardDTO dto);

	QBoardDTO getBoard(int qseq);

	boolean deleteBoard(int qseq);

	boolean updateBoard(QBoardDTO dto);

	boolean mulDel(String[] chk);

	boolean insertReply(QBoardDTO dto);

}
