package com.luna.board.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.luna.board.daos.IEBoardDAO;
import com.luna.board.dtos.EBoardDTO;
import com.luna.board.dtos.ImgFileDTO;
import com.luna.board.dtos.PagingDTO;
import com.luna.board.dtos.RBoardDTO;

@Service
public class EBoardService implements IEBoardService {

	@Autowired
	IEBoardDAO EBoardDAO;
	
	@Override
	public boolean insertBoard(EBoardDTO dto,MultipartHttpServletRequest request) {
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		MultipartFile multiFile =multi.getFile("imgname");
		
		String imgname = multiFile.getOriginalFilename();
		int fileSize = (int)multiFile.getSize();
		
		String path2=request.getSession()
				.getServletContext().getRealPath("upload");
		System.out.println(path2);
		File f = new File(path2+"/"+imgname);
		
		boolean isS =false;
		isS  =EBoardDAO.insertBoard(dto);
		try {
			multiFile.transferTo(f);
			isS=EBoardDAO.insertImg(new ImgFileDTO(0,fileSize,imgname,"",0,0,0,"true"));
		}catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isS;
	}

	@Override
	public List<EBoardDTO> getAllList() {
		return EBoardDAO.getAllList();
	}

	@Override
	public EBoardDTO getBoard(int eseq) {
		return EBoardDAO.getBoard(eseq);
	}

	@Override
	public boolean deleteBoard(int eseq) {
		return EBoardDAO.deleteBoard(eseq);
	}

	@Override
	public boolean updateBoard(EBoardDTO dto,MultipartHttpServletRequest request) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		MultipartFile multiFile =multi.getFile("imgname");
		String imgname = multiFile.getOriginalFilename();
		int fileSize = (int)multiFile.getSize();
		String path2=request.getSession()
				.getServletContext().getRealPath("upload");
		System.out.println(path2);
		File f = new File(path2+"/"+imgname);
		boolean isS =false;
		isS =EBoardDAO.updateBoard(dto);
		try {
			multiFile.transferTo(f);
			isS=EBoardDAO.updateImg(new ImgFileDTO(0,fileSize,imgname,"",0,0,dto.getEseq(),"true"));
		}catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isS;
	}

	@Override
	public boolean mulDel(String[] chk) {
		return EBoardDAO.mulDel(chk);
	}

	

	@Override
	public List<EBoardDTO> getPagingList(PagingDTO pagingDTO) {
		// TODO Auto-generated method stub
		return EBoardDAO.getPagingList(pagingDTO);
	}

	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return EBoardDAO.countBoard();
	}

	

}
