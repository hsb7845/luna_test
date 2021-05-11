package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
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
	public boolean insertMember(MemberDTO dto) {
		return sqlSession.insert(namespace+"insertMember", dto)>0? true:false;
	}
	
	@Override
	public List<MemberDTO> getAllList() {
		return sqlSession.selectList(namespace+"getAllList");
	}
	
	@Override
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne(namespace+"getMember",id);
	}
	
	@Override
	public boolean updateMember(MemberDTO dto) {
		return sqlSession.update(namespace+"updateMember", dto)>0? true:false;
	}
	

	@Override
	public boolean muldelMember(String[] chks) {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"muldelMember",map)>0?true:false;
	}
	
	@Override
	public int idChk(MemberDTO dto) throws Exception {
		int result= sqlSession.selectOne(namespace+"idChk", dto);
		return result;
				
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		// TODO Auto-generated method stub
		dto = sqlSession.selectOne(namespace+"login", dto);
		System.out.println(dto.getAdmin());
	
		return dto;
	}


	@Override
	public MemberDTO getMemberByNameAndEmail(MemberDTO dto) {
		// TODO Auto-generated method stub
		MemberDTO member = new MemberDTO();
		member = sqlSession.selectOne(namespace+"idSearch", dto);
		if(member!=null) {
			boolean isS = (member.getId()==null);
			System.out.println(isS);
		}
		
		return member;
	}

}