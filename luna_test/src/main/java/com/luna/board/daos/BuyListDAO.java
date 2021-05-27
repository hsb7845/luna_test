package com.luna.board.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.BuyDetailDTO;
import com.luna.board.dtos.BuyListDTO;
import com.luna.board.dtos.CartDTO;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;


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
		Map<String,Object> map = new HashMap<>();
		PBoardDTO dto = sqlSession.selectOne("com.luna.pboard.getPBoard", pseq);
		map.put("dto", dto);
		return map;
	}

	@Override
	public MemberDTO getMember(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getMember", id);
	}

	@Override
	public boolean insertBuyList(BuyListDTO blDTO, List<BuyDetailDTO> list) {
		// TODO Auto-generated method stub
		boolean isS = sqlSession.insert(namespace+"insertBuyList",blDTO)>0?true:false;
		for(int i=0;i<list.size();i++) {
			BuyDetailDTO dto = list.get(i);
			isS = sqlSession.insert(namespace+"insertBuyDetail",dto)>0?true:false;
		}
		
		//isS = sqlSession.update(namespace+"insertBuyDetail",list)>0?true:false;
		return isS;
	}

	@Override
	public List<CartDTO> getSelCart(String[] chks,String id) {
		// TODO Auto-generated method stub
		List<CartDTO> list= new ArrayList<>();
		Map<String,String> map = new HashMap<>();
		
		//System.out.println(chks.toString());
		for(int i=0;i<chks.length;i++) {
			map.clear();
			map.put("id", id);
			map.put("seq", chks[i]);
			CartDTO dto = sqlSession.selectOne(namespace+"getCart",map);
			list.add(dto);
		}
		return list;
	}

	@Override
	public void deleteInCart(String[] chks, String id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("chks",chks);
		map.put("id", id);
		sqlSession.delete(namespace+"delInCart", map);
		
	}
	
}
