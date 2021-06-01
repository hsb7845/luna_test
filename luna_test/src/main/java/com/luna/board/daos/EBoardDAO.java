package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.EBoardDTO;
import com.luna.board.dtos.ImgFileDTO;
import com.luna.board.dtos.PagingDTO;

@Repository
public class EBoardDAO implements IEBoardDAO{
	private String namespace = "com.luna.eboard.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public boolean insertBoard(EBoardDTO dto) {
		return sqlSession.insert(namespace+"insertboard",dto)>0? true:false;
	}

	@Override
	public List<EBoardDTO> getAllList() {
		return sqlSession.selectList(namespace+"getAllList");
	}
	
	@Override
	public EBoardDTO getBoard(int eseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getBoard", eseq);
	}

	@Override
	public boolean deleteBoard(int eseq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteBoard",eseq)>0?true:false;
	}

	@Override
	public boolean updateBoard(EBoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateBoard",dto)>0? true:false;
	}

	@Override
	public boolean mulDel(String[] chks) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}

	@Override
	public boolean insertImg(ImgFileDTO imgFileDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"insertImg", imgFileDTO)>0?true:false;
	}

	@Override
	public boolean updateImg(ImgFileDTO imgFileDTO) {
		// TODO Auto-generated method stub
		return  sqlSession.update(namespace+"updateImg", imgFileDTO)>0?true:false;
	}

	@Override
	public List<EBoardDTO> getPagingList(PagingDTO pagingDTO, String board) {
		// TODO Auto-generated method stub
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("pagingDTO", pagingDTO);
		if(board.equals("event")) {
			map.put("board", "이벤트");
		}else if(board.equals("notice")) {
			map.put("board","공지");
		}
		
		return sqlSession.selectList(namespace+"getPagingList",map);
	}

	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"countBoard");
	}

	@Override
	public EBoardDTO getDetail(int eseq, String board) {
		// TODO Auto-generated method stub
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("eseq", eseq);
		if(board.equals("event")) {
			map.put("board", "이벤트");
		}else if(board.equals("notice")) {
			map.put("board","공지");
		}
		
		return sqlSession.selectOne(namespace+"getDetail", map);
	}
}
