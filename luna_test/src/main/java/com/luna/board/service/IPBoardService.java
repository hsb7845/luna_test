package com.luna.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.POptionDTO;
import com.luna.board.dtos.PagingDTO;
import com.luna.board.dtos.RBoardDTO;
import com.luna.board.dtos.StockDTO;

public interface IPBoardService {
	boolean insertBoard(PBoardDTO dto,int[] pnum, List<POptionDTO> optionList, int mainNum);
	List<PBoardDTO> getAllList(String select);
	PBoardDTO getBoard(int pseq);
	boolean deleteBoard(int pseq);
	boolean updateBoard(PBoardDTO dto);
	boolean mulDel(String[] chk);
	int countBoard(String sorting);
	List<PBoardDTO> getPagingList(PagingDTO pagingDTO);
	Map<String, Object> getDetail(int pseq);
	List<PCategoryDTO> getCategory(String[] chk_arr);
	boolean uploadImg(HttpServletRequest request);
	boolean uploadFile(MultipartFile[] uploadFiles, HttpServletRequest request);
	MemberDTO getMember(String id);
	int serachId(String id, int pseq);
	List<StockDTO> getListType(String ptype);
	Map<String, Object> getDetailUpdateForm(int pseq);
	void updateBoard(PBoardDTO dto, int[] pnum, List<POptionDTO> optionList, int mainNum, int pseq);
	Map<String, Object> mainPage();
	RBoardDTO showAnsR(int rseq);
}
