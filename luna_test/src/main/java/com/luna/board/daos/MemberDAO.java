package com.luna.board.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.MemberDTO;

@Repository
public class MemberDAO implements IMemberDAO {

	private String namespace = "com.luna.member.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public boolean insertBoad(MemberDTO dto) {
		return sqlSession.insert(namespace+"insertmember", dto)>0? true:false;
	}
	
	@Override
	public List<MemberDTO> getAllList() {
		return sqlSession.selectList(namespace+"getAllList");
	}
}
