package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IMemberDAO;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;

@Service
public class MemberService implements IMemberService{
	
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

}
