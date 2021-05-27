package com.luna.board.daos;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.luna.board.dtos.CouponDTO;
import com.luna.board.dtos.MemberDTO;

public interface IMemberDAO {

	List<MemberDTO> getAllList();
	boolean insertMember(MemberDTO mdto, CouponDTO cdto);
	MemberDTO getMember(String id);
	boolean updateMember(MemberDTO dto);
	boolean muldelMember(String[] chks);
	public int idChk(MemberDTO dto) throws Exception;
	MemberDTO login(MemberDTO dto);
	public void logout(HttpSession session);
	MemberDTO getMemberByNameAndEmail(MemberDTO dto);
	MemberDTO getMemberByIdAndEmail(MemberDTO dto);
    public boolean pwdUpdate(MemberDTO dto);
	boolean deleteMember(MemberDTO dto);
	boolean insertKMember(MemberDTO dto);
	
	List<MemberDTO> BirthMember();

}
