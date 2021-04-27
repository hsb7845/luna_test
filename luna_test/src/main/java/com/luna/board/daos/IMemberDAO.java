package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.MemberDTO;

public interface IMemberDAO {

	List<MemberDTO> getAllList();

	boolean insertMember(MemberDTO dto);

}
