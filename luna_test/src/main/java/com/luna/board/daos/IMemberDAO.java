package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.MemberDTO;

public interface IMemberDAO {

	boolean insertBoad(MemberDTO dto);

	List<MemberDTO> getAllList();

}
