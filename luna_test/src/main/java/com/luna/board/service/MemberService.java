package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IMemberDAO;
import com.luna.board.dtos.MemberDTO;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	IMemberDAO MemberDAO;

	@Override
	public boolean insertBoad(MemberDTO dto) {
		// TODO Auto-generated method stub
		return MemberDAO.insertBoad(dto);
	}

	@Override
	public List<MemberDTO> getAllList() {
		// TODO Auto-generated method stub
		return MemberDAO.getAllList();
	}


}
