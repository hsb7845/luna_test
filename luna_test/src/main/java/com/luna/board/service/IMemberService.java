package com.luna.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.luna.board.dtos.CouponDTO;
import com.luna.board.dtos.MemberDTO;

public interface IMemberService {
	List<MemberDTO> getAllList();
	boolean insertMember(MemberDTO dto);
	MemberDTO getMember(String id);
	boolean deleteMember(MemberDTO dto);
	boolean updateMember(MemberDTO dto);
	boolean muldelMember(String[] chk);
	public int idChk(MemberDTO dto) throws Exception;
	MemberDTO login(MemberDTO dto);
	public void logout(HttpSession session);
	MemberDTO getMemberByNameAndEmail(MemberDTO dto);
	MemberDTO getMemberByIdAndEmail(MemberDTO dto);
	boolean pwdUpdate(MemberDTO dto);
	boolean insertKMember(MemberDTO dto);
	
	List<MemberDTO> BirthMember();
	
	
	
	
}
