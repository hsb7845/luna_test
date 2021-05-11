package com.luna.board.service;

import java.lang.reflect.Member;
import java.util.List;

import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;

public interface IMemberService {

	boolean insertMember(MemberDTO dto);

	List<MemberDTO> getAllList();

	MemberDTO getMember(String id);

	boolean updateMember(MemberDTO dto);

	boolean muldelMember(String[] chk);

	public int idChk(MemberDTO dto) throws Exception;

	MemberDTO login(MemberDTO dto);

	MemberDTO getMemberByNameAndEmail(MemberDTO dto);



}
