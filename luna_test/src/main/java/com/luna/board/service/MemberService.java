 package com.luna.board.service;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IMemberDAO;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;

@Service
public class MemberService implements IMemberService{
	
	private static final MemberDTO MemberDTO = null;
	@Autowired
	IMemberDAO MemberDAO;

	@Override
	public boolean insertMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return MemberDAO.insertMember(dto);
	}

	@Override
	public List<MemberDTO> getAllList() {
		// TODO Auto-generated method stub
		return MemberDAO.getAllList();
	}

	@Override
	public MemberDTO getMember(String id) {
		// TODO Auto-generated method stub
		return MemberDAO.getMember(id);
	}

	@Override
	public boolean updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return MemberDAO.updateMember(dto);
	}

	@Override
	public boolean muldelMember(String[] chk) {
		// TODO Auto-generated method stub
		return MemberDAO.muldelMember(chk);
	}

	@Override
	public int idChk(MemberDTO dto) throws Exception{
		int result= MemberDAO.idChk(dto);
		return result;
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		// TODO Auto-generated method stub
		return MemberDAO.login(dto);
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public MemberDTO getMemberByNameAndEmail(MemberDTO dto) {
		// TODO Auto-generated method stub
		return MemberDAO.getMemberByNameAndEmail(dto);
	}

	@Override
	public MemberDTO getMemberByIdAndEmail(MemberDTO dto) {
		// TODO Auto-generated method stub
		return MemberDAO.getMemberByIdAndEmail(dto);
	}
	
	@Override
    public boolean pwdUpdate(MemberDTO dto) {
		return MemberDAO.pwdUpdate(dto);
	}

	@Override
	public boolean deleteMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return MemberDAO.deleteMember(dto);
	}
	
	@Override
	public boolean insertKMember(MemberDTO dto) {
		return MemberDAO.insertKMember(dto);
	}


}
