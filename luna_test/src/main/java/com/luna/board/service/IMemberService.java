package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;

public interface IMemberService {

	boolean insertMember(MemberDTO dto);

	List<MemberDTO> getAllList();

	PBoardDTO getMember(int pseq);

	boolean updateMember(MemberDTO dto);

	boolean mulDelMember(String[] chk);


}
