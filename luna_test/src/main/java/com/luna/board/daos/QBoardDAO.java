package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.QBoardDTO;
import com.luna.board.dtos.RBoardDTO;

@Repository
public class QBoardDAO implements IQBoardDAO{
	private String namespace = "com.luna.qboard.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public boolean insertBoard(QBoardDTO dto) {
		return sqlSession.insert(namespace+"insertboard",dto)>0? true:false;
	}

	@Override
	public List<QBoardDTO> getAllList(QBoardDTO dto) {
		if(dto.getId()!=null) {
			return sqlSession.selectList(namespace+"getList",dto);
		}
		
		return sqlSession.selectList(namespace+"getAllList",dto);
	}
	
	@Override
	public QBoardDTO getBoard(int qseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getBoard",qseq);
	}

	@Override
	public boolean deleteBoard(int qseq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteBoard",qseq)>0?true:false;
	}

//	@Override
//	public boolean updateBoard(QBoardDTO dto) {
//		// TODO Auto-generated method stub
//		return sqlSession.update(namespace+"updateBoard",dto)>0? true:false;
//	}

	@Override
	public boolean insertReply(QBoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"insertReply",dto)>0? true:false;
	}
	
	@Override
	public boolean mulDel(String[] chks) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}
}