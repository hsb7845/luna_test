package com.luna.board.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.luna.board.daos.IPBoardDAO;
import com.luna.board.dtos.ImgFileDTO;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.POptionDTO;
import com.luna.board.dtos.PagingDTO;
import com.luna.board.dtos.StockDTO;

@Service

public class PBoardService implements IPBoardService{

	@Autowired
	IPBoardDAO PBoardDAO;


	@Override
	public List<PBoardDTO> getAllList() {
		// TODO Auto-generated method stub
		return PBoardDAO.getAllList();
	}

	@Override
	public PBoardDTO getBoard(int pseq) {
		// TODO Auto-generated method stub
		PBoardDAO.boardHit(pseq);
		return PBoardDAO.getBoard(pseq);
	}


	@Override
	public boolean deleteBoard(int pseq) {
		// TODO Auto-generated method stub
		return PBoardDAO.deleteBoard(pseq);
	}


	@Override
	public boolean updateBoard(PBoardDTO dto) {
		// TODO Auto-generated method stub
		return PBoardDAO.updateBoard(dto);
	}


	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return PBoardDAO.mulDel(chk);
	}


	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return PBoardDAO.countBoard();
	}


	@Override
	public List<PBoardDTO> getPagingList(PagingDTO pagingDTO) {
		// TODO Auto-generated method stub
		return PBoardDAO.getPagingList(pagingDTO);
	}


	@Override
	public Map<String, Object> getDetail(int pseq) {
		// TODO Auto-generated method stub
		PBoardDAO.boardHit(pseq);
		return PBoardDAO.getDetail(pseq);
	}


	@Override
	public List<PCategoryDTO> getCategory(String[] chk_arr) {
		// TODO Auto-generated method stub
		return PBoardDAO.getCategory(chk_arr);
	}


	@Override
	public boolean insertBoard(PBoardDTO dto, int[] pnum, List<POptionDTO> optionList,int mainNum) {
		// TODO Auto-generated method stub
		boolean isS =false;
		isS = PBoardDAO.insertBoard(dto, pnum,optionList,mainNum);
		return isS;
	}


	@Override
	public boolean uploadImg(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;

			//요청파일 가져오기
			//MultipartFile multiFile=multi.getFile("filename");//하나 업로드
			List<MultipartFile> multiFiles=multi.getFiles("filename");//여러개 업로드
			//System.out.println("파일개수:"+multiFiles.size());
			boolean isS=false;
			for(MultipartFile multiFile:multiFiles) {
					System.out.println("test");
					//1.요청한 파일에서 원본파일 이름 구하기: originName구하기
					String imgname = multiFile.getOriginalFilename();
					//2.UUID객체를 통해서 파일명을 랜덤하게 32자리로 생성 --> 저장할 파일명(storedName)
					//UUID에서 기본적으로 만들어지는 패턴: 12345678-12345678-12345678-12345678
					//3.파일 사이즈 구하기 
					int fileSize=(int)multiFile.getSize();
					
					//4.파일업로드
					//절대경로설정
					String path="D:/src/src20201121/filepuload_springMVC"
						  + "/src/main/webapp/upload";
					
					//상대경로설정
					String path2=request.getSession()
						.getServletContext().getRealPath("upload");
					System.out.println("path2:"+path2);
					File f=new File(path2+"/"+imgname);
					
					
					
					try {
					multiFile.transferTo(f);//파일객체의 저장된 경로대로 업로드 실행됨.
					//파일정보를 DB에 저장하기
					ImgFileDTO dto = new ImgFileDTO(0, fileSize, imgname,(String)session.getAttribute("id"), 0, 0, 0);
					isS = PBoardDAO.uploadImg(dto);
					} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					}
			
			}
			
			return isS;
	}


	@Override
	public boolean uploadFile(MultipartFile[] uploadFiles,HttpServletRequest request) {
		// TODO Auto-generated method stub
		 Map<String,Object>fileMap=new HashMap<String,Object>();
		 HttpSession session = request.getSession();
		 boolean isS = false;
	        for(MultipartFile multipartFile : uploadFiles) {
	            try {
	               String fileName=multipartFile.getOriginalFilename();
	               String path2=request.getSession().getServletContext().getRealPath("upload");
	               System.out.println(path2);
	                File tmp=new File(path2+"/"+fileName);
	                int fileSize=(int)multipartFile.getSize();
	                fileMap.put("fileName", fileName);
	                fileMap.put("fileSize", multipartFile.getSize());
	                System.out.println("fileMap :"+fileMap);
	                multipartFile.transferTo(tmp);
	                ImgFileDTO dto = new ImgFileDTO(0, fileSize, fileName,(String)session.getAttribute("id"), 0, 0, 0);
	                isS = PBoardDAO.uploadImg(dto);
	            }
	            catch(Exception e){
	                return false;
	            }
	    }
	        return isS;
	}

	@Override
	public MemberDTO getMember(String id) {
		// TODO Auto-generated method stub
		return PBoardDAO.getMember(id);
	}
	
	
}
