package com.luna.board.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.EBoardDTO;
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
	public void updateBoard(PBoardDTO dto, int[] pnum, List<POptionDTO> optionList, int mainNum, int pseq) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+"updateBoard",dto);
		//System.out.println("원래 내용 업데이트!");
		Map<String,Object> map = new HashMap<>();
		String main ="";
		sqlSession.update(namespace+"clearStock", pseq);
		for(int i=0;i<pnum.length;i++) {
			if(pnum[i]==mainNum) {
				main = "true";
				
			}else {
				main = "false";
			}
			
			map.put("pnum", pnum[i]);
			map.put("main", main);
			map.put("pseq",pseq);
			sqlSession.update(namespace+"updateStock", map);
			//System.out.println("재고 업데이트!");
		}
		sqlSession.delete(namespace+"deleteOption",pseq);
		System.out.println("기존옵션 삭제!");
		for(int i=0;i<optionList.size();i++) {
			//System.out.println(optionList.get(i).getOvalue());
			sqlSession.update(namespace+"insertoption", optionList.get(i));
			//System.out.println("새 옵션 추가!!");
		}
	}
	
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
			map.put("pseq", 0);
			isS2 = sqlSession.update(namespace+"updateStock", map)>0? true:false;
		}
		for(int i=0;i<optionList.size();i++) {
			//System.out.println(optionList.get(i).getOvalue());
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
	public int countBoard(String sorting) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"countBoard",sorting);
	}

	@Override
	public List<PBoardDTO> getPagingList(PagingDTO pagingDTO) {
		// TODO Auto-generated method stub
		List<PBoardDTO> list = sqlSession.selectList(namespace+"getPagingList", pagingDTO);
		//list.get(0).getPseq();
		return sqlSession.selectList(namespace+"getPagingList", pagingDTO);
	}

	@Override
	public Map<String, Object> getDetail(int pseq) {

		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<>();
		//System.out.println(pseq);
		PBoardDTO pboard= sqlSession.selectOne(namespace+"getPBoard", pseq);
		String avg = sqlSession.selectOne(namespace+"getAvgRank", pseq);
		double avgRank = 0;
		if(avg!=null) {
			avgRank = Double.parseDouble(avg);
		}
		map.put("avgRank",avgRank);
		List<ImgFileDTO> img = sqlSession.selectList(namespace+"getImage",pseq);
		List<RBoardDTO> rboard = sqlSession.selectList(namespace+"getRboard", pseq);
		List<QBoardDTO> qboard = sqlSession.selectList(namespace+"getQboard", pseq);
		List<Map<String,String>> countRank = sqlSession.selectList(namespace+"countStarrank", pseq);
		int count = sqlSession.selectOne(namespace+"count",pseq);
		Map<Integer,Integer> rankAvg = new HashMap<Integer, Integer>();
		int per = 0;
		//System.out.println(countRank);
		//System.out.println(String.valueOf(countRank.get(0).get("count")));
		//System.out.println((Integer.parseInt(String.valueOf(countRank.get(0).get("count")))));
		//System.out.println(count);
		System.out.println(countRank);
		if(!countRank.isEmpty()) {
			switch(Integer.parseInt(String.valueOf(countRank.get(0).get("starrank")))) {
			case 1:
				for(int i=1;i<=5;i++) {
					rankAvg.clear();
					per =(int) ((double)(Integer.parseInt(String.valueOf(countRank.get(i-1).get("count")))/(double)count)*100.0);
					rankAvg.put(i,per);
				}
				break;
			case 2:
				rankAvg.clear();
				for(int i=2;i<=5;i++) {
					
					per =(int) ((double)(Integer.parseInt(String.valueOf(countRank.get(i-2).get("count")))/(double)count)*100.0);
					rankAvg.put(i,per);
				}
				rankAvg.put(1,0);
				break;
			case 3:
				rankAvg.clear();
				for(int i=3;i<=5;i++) {
					per =(int) ((double)(Integer.parseInt(String.valueOf(countRank.get(i-3).get("count")))/(double)count)*100.0);
					rankAvg.put(i,per);
				}
				rankAvg.put(1,0);
				rankAvg.put(2,0);
				break;
			case 4:
				rankAvg.clear();
				for(int i=4;i<=5;i++) {
					per =(int) ((double)(Integer.parseInt(String.valueOf(countRank.get(i-4).get("count")))/(double)count)*100.0);
					rankAvg.put(i,per);
				}
				rankAvg.put(1,0);
				rankAvg.put(2,0);
				rankAvg.put(3,0);
				
				break;
			case 5:
				rankAvg.clear();
				per =(int)((double)(Integer.parseInt(String.valueOf(countRank.get(0).get("count")))/(double)count)*100.0);
				rankAvg.put(1,0);
				rankAvg.put(2,0);
				rankAvg.put(3,0);
				rankAvg.put(4,0);
				rankAvg.put(5,per);
				break;
		}
		System.out.println(rankAvg);
		}
		//System.out.println((double)(Integer.parseInt(String.valueOf(countRank.get(0).get("count")))/(double)count)*100.0);
		
		List<POptionDTO> option= sqlSession.selectList(namespace+"getOption", pseq);
		for(int i=0;i<option.size();i++) {
			option.get(i).setOconArr(option.get(i).getOcontent().split("/"));
			option.get(i).setOvalArr(option.get(i).getOvalue().split("/"));
		}
		map.put("pboard",pboard);
		map.put("img", img);
		map.put("rboard",rboard);
		map.put("qboard", qboard);
		map.put("rankAvg", rankAvg);
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

	@Override
	public int searchId(String id, int pseq) {
		// TODO Auto-generated method stub
		System.out.println("id"+id);
		System.out.println("pseq"+pseq);
		Map<String,Object> map =  new HashMap<>();
		map.put("id",id);
		map.put("pseq",pseq);
		return sqlSession.selectOne(namespace+"searchId", map);
	}

	@Override
	public List<StockDTO> getListType(String ptype) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getListType", ptype);
	}

	@Override
	public Map<String, Object> getDetailUpdateForm(int pseq) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<>();
		PBoardDTO pboard= sqlSession.selectOne(namespace+"getPBoard", pseq);
		List<StockDTO> stockList = sqlSession.selectList(namespace+"getStock", pseq);
		List<POptionDTO> option= sqlSession.selectList(namespace+"getOption", pseq);
		for(int i=0;i<option.size();i++) {
			option.get(i).setOconArr(option.get(i).getOcontent().split("/"));
			option.get(i).setOvalArr(option.get(i).getOvalue().split("/"));
		}
		map.put("option",option);
		map.put("pboard", pboard);
		map.put("stockList",stockList);
		return map;
	}

	@Override
	public Map<String, Object> mainPage() {
		// TODO Auto-generated method stub
		Map<String,Object> map =new HashMap<>();
		PagingDTO pagingDTO = new PagingDTO();
		
		pagingDTO.setStart(1);
		pagingDTO.setEnd(5);
		pagingDTO.setArrayNum(4);
		List<PBoardDTO> list = sqlSession.selectList(namespace+"getPagingList",pagingDTO);
		map.put("best",list);
		for(int i=1;i<=5;i++) {
			list = new ArrayList<>();
			String paging ="paging"+i;
			pagingDTO.setSorting(i);
			list = sqlSession.selectList(namespace+"getPagingList", pagingDTO);
			map.put(paging,list);
		}
		pagingDTO = new PagingDTO();
		pagingDTO.setStart(1);
		pagingDTO.setEnd(3);
		List<EBoardDTO> eventList = sqlSession.selectList(namespace+"getEboard",pagingDTO);
		map.put("event", eventList);
		
		return map;
	}


}
