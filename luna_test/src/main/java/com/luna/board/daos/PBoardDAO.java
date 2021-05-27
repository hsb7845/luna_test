package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.ImgFileDTO;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.POptionDTO;
import com.luna.board.dtos.PagingDTO;
import com.luna.board.dtos.QBoardDTO;
import com.luna.board.dtos.RBoardDTO;
import com.luna.board.dtos.StockDTO;

@Repository
public class PBoardDAO implements IPBoardDAO{	

	private String namespace = "com.luna.pboard.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public boolean insertBoard(PBoardDTO dto, int[] pnum_arr, List<POptionDTO> optionList,int mainNum) {
		Map<String,Object> map = new HashMap<>();
		boolean isS = sqlSession.insert(namespace+"insertboard",dto)>0? true:false;
		boolean isS2 = false;
		String main ="";
		for(int i=0;i<pnum_arr.length;i++) {
			if(pnum_arr[i]==mainNum) {
				main = "true";
				
			}else {
				main = "false";
			}
			map.put("pnum", pnum_arr[i]);
			map.put("main", main);
			isS2 = sqlSession.update(namespace+"updateStock", map)>0? true:false;
		}
 		
 		
	
		
		for(int i=0;i<optionList.size();i++) {
			System.out.println(optionList.get(i).getOvalue());
			isS2= sqlSession.insert(namespace+"insertoption", optionList.get(i))>0? true:false;
		}
		boolean isS3 = false;
		if(isS&&isS2) {
			isS3 = true;
		}
		
		return isS3;
	}

	@Override
	public List<PBoardDTO> getAllList(String select) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getAllList",select);
	}

	@Override
	public PBoardDTO getBoard(int pseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getBoard",pseq);
	}

	@Override
	public boolean deleteBoard(int pseq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteBoard",pseq)>0?true:false;
	}

	@Override
	public boolean updateBoard(PBoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateBoard",dto)>0? true:false;
	}

	@Override
	public boolean mulDel(String[] chks) {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}

	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"countBoard");
	}

	@Override
	public List<PBoardDTO> getPagingList(PagingDTO pagingDTO) {
		// TODO Auto-generated method stub
		List<PBoardDTO> list = sqlSession.selectList(namespace+"getPagingList", pagingDTO);
		list.get(0).getPseq();
		return sqlSession.selectList(namespace+"getPagingList", pagingDTO);
	}

	@Override
	public Map<String, Object> getDetail(int pseq) {

		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<>();
		System.out.println(pseq);
		PBoardDTO pboard= sqlSession.selectOne(namespace+"getPBoard", pseq);
		String avg = sqlSession.selectOne(namespace+"getAvgRank", pseq);
		double avgRank = 0;
		if(avg!=null) {
			avgRank = Double.parseDouble(avg);
		}
		List<ImgFileDTO> img = sqlSession.selectList(namespace+"getImage",pseq);
		List<RBoardDTO> rboard = sqlSession.selectList(namespace+"getRboard", pseq);
		List<QBoardDTO> qboard = sqlSession.selectList(namespace+"getQboard", pseq);
		List<Integer> countRank = sqlSession.selectList(namespace+"countStarrank", pseq);
		List<POptionDTO> option= sqlSession.selectList(namespace+"getOption", pseq);
		for(int i=0;i<option.size();i++) {
			option.get(i).setOconArr(option.get(i).getOcontent().split("/"));
			option.get(i).setOvalArr(option.get(i).getOvalue().split("/"));
		}
		map.put("avgRank",avgRank);
		map.put("pboard",pboard);
		map.put("img", img);
		map.put("rboard",rboard);
		map.put("qboard", qboard);
		map.put("countRank", countRank);
		map.put("option", option);
		return map;
	}
	
	@Override
	public List<PCategoryDTO> getCategory(String[] chk_arr) {
		// TODO Auto-generated method stub
		Map<String,String[]> map = new HashMap<>();
		map.put("chk", chk_arr);
		
		return sqlSession.selectList(namespace+"getCategory", map);
	}

	@Override
	public boolean uploadImg(ImgFileDTO dto) {
		// TODO Auto-generated method stu
		boolean isS = sqlSession.insert(namespace+"insertimgFile", dto)>0?true:false;
	
		return isS;
	}

	@Override
	public void boardHit(int pseq) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+"boardHit", pseq);
	}

	@Override
	public MemberDTO getMember(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getAdr", id);
	}
}
