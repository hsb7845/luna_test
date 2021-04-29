package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.POptionDTO;
import com.luna.board.dtos.POptionDTO;


@Repository
	public class POptionDAO implements IPOptionDAO{
		private String namespace = "com.luna.poption.";
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String[] chks;
	
	@Override
	public List<POptionDTO> getAllList() {
		return sqlSession.selectList(namespace+"getAllList");
		}
		
		@Override
		public boolean insertPoption(POptionDTO dto) {
			// TODO Auto-generated method stub
			return sqlSession.insert(namespace+"insertPoption",dto)>0?true:false;
		}

		@Override
		public POptionDTO getPoption(int qseq) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(namespace+"getPoption",qseq);
		}

		@Override
		public	boolean updatePoption(POptionDTO dto) {
			// TODO Auto-generated method stub
			return sqlSession.update(namespace+"updatPoption", dto)>0?true:false;
		}
		
		@Override
		public 	boolean mulDelPoption(String[] chk) {
			// TODO Auto-generated method stub
			Map<String, String[]> map = new HashMap<String, String[]>();
			map.put("chks", chks);
			return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
		}
}
	