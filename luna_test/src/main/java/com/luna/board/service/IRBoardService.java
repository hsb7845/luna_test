package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.RBoardDTO;

public interface IRBoardService {
	boolean insertBoard(RBoardDTO dto);
	RBoardDTO getBoard(int rseq);
	boolean deleteBoard(int rseq);
	boolean updateBoard(RBoardDTO dto);
	boolean mulDel(String[] chk);
	boolean insertReply(RBoardDTO dto);
	MemberDTO getMember(String id);
	List<RBoardDTO> getAllList(RBoardDTO dto);
}
