package com.luna.board.daos;

import java.util.List;
import java.util.Map;

import com.luna.board.dtos.ImgFileDTO;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.POptionDTO;
import com.luna.board.dtos.PagingDTO;
import com.luna.board.dtos.StockDTO;

public interface IPBoardDAO {
	boolean insertBoard(PBoardDTO dto, int[] pnum, List<POptionDTO> optionList, int mainNum);
    List<PBoardDTO> getAllList(String select);
	PBoardDTO getBoard(int pseq);
	boolean deleteBoard(int pseq);
	boolean updateBoard(PBoardDTO dto);
	boolean mulDel(String[] chk);
	int countBoard(String sorting);
	List<PBoardDTO> getPagingList(PagingDTO pagingDTO);
	Map<String, Object> getDetail(int pseq);
	List<PCategoryDTO> getCategory(String[] chk_arr);
	boolean uploadImg(ImgFileDTO dto);
	void boardHit(int pseq);
	MemberDTO getMember(String id);
	int searchId(String id, int pseq);
	List<StockDTO> getListType(String ptype);
	
}
