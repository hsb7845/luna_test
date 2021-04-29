package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.ImgFileDTO;

@Repository
public class ImgFileDAO implements IImgFileDAO {
	
	private String namespace = "com.luna.imgfile.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public boolean insertBoard(ImgFileDTO dto) {
		return sqlSession.insert(namespace+"insertboard",dto)>0? true:false;
	}

	@Override
	public List<ImgFileDTO> getAllList() {
		return sqlSession.selectList(namespace+"getAllList");
	}
	
	@Override
	public ImgFileDTO getBoard(int imgnum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getBoard", imgnum);
	}

	@Override
	public boolean deleteBoard(int imgnum) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteBoard", imgnum)>0?true:false;
	}

	@Override
	public boolean updateBoard(ImgFileDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateBoard",dto)>0? true:false;
	}

	@Override
	public boolean mulDel(String[] chks) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}
}
