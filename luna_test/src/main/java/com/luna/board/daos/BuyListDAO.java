package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.BuyListDTO;


@Repository
public class BuyListDAO implements IBuyListDAO {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.luna.buylist.";
	
	@Override
	public boolean insertBoard(BuyListDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"insertBoard",dto)>0?true:false;
	}

	@Override
	public List<BuyListDTO> getAllList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getAllList");
	}

	@Override
	public BuyListDTO getBoard(int bseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getBoard", bseq);
	}

	@Override
	public boolean deleteBoard(int bseq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteBoard",bseq)>0?true:false;
	}

	@Override
	public boolean updateBoard(BuyListDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateBoard",dto)>0?true:false;
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new HashMap<>();
		map.put("chks",chk);

		return sqlSession.insert(namespace+"mulDelBoard",map)>0?true:false;
	}

	@Override
	public Map<String, Object> getPBoard(int pseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.luna.pboard.getPBoard", pseq);
	}
	
}
