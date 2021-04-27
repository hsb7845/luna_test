package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.MemberDTO;

public interface IMemberService {

	boolean insertMember(MemberDTO dto);

	List<MemberDTO> getAllList();

}
