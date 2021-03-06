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
import com.luna.board.dtos.QBoardDTO;
import com.luna.board.dtos.RBoardDTO;
import com.luna.board.dtos.StockDTO;

@Service

public class PBoardService implements IPBoardService{

	@Autowired
	IPBoardDAO PBoardDAO;


	@Override
	public List<PBoardDTO> getAllList(String select) {
		// TODO Auto-generated method stub
		return PBoardDAO.getAllList(select);
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
	public int countBoard(String sorting) {
		// TODO Auto-generated method stub
		return PBoardDAO.countBoard(sorting);
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
	public Map<String,Object> insertBoard(PBoardDTO dto, int[] pnum, List<POptionDTO> optionList,int mainNum) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = PBoardDAO.insertBoard(dto, pnum,optionList,mainNum);
		return map;
	}


	@Override
	public boolean uploadImg(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;

			//???????????? ????????????
			//MultipartFile multiFile=multi.getFile("filename");//?????? ?????????
			List<MultipartFile> multiFiles=multi.getFiles("filename");//????????? ?????????
			//System.out.println("????????????:"+multiFiles.size());
			boolean isS=false;
			for(MultipartFile multiFile:multiFiles) {
					System.out.println("test");
					//1.????????? ???????????? ???????????? ?????? ?????????: originName?????????
					String imgname = multiFile.getOriginalFilename();
					//2.UUID????????? ????????? ???????????? ???????????? 32????????? ?????? --> ????????? ?????????(storedName)
					//UUID?????? ??????????????? ??????????????? ??????: 12345678-12345678-12345678-12345678
					//3.?????? ????????? ????????? 
					int fileSize=(int)multiFile.getSize();
					
					//4.???????????????
					//??????????????????
					String path="D:/src/src20201121/filepuload_springMVC"
						  + "/src/main/webapp/upload";
					
					//??????????????????
					String path2=request.getSession()
						.getServletContext().getRealPath("upload");
					System.out.println("path2:"+path2);
					File f=new File(path+"/"+imgname);
					
					
					
					try {
					multiFile.transferTo(f);//??????????????? ????????? ???????????? ????????? ?????????.
					//??????????????? DB??? ????????????
					ImgFileDTO dto = new ImgFileDTO(0, fileSize, imgname,(String)session.getAttribute("id"), 0, 0, 0,"true");
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
		 int count = 0;
	        for(MultipartFile multipartFile : uploadFiles) {
	            try {
	               String fileName=multipartFile.getOriginalFilename();
	               
	               String path = "C:\\Users\\??????\\git\\luna_test\\luna_test\\src\\main\\webapp\\upload";
	               String path2=request.getSession().getServletContext().getRealPath("upload");
	               System.out.println(path2);
	                File tmp=new File(path+"/"+fileName);
	                int fileSize=(int)multipartFile.getSize();
	                fileMap.put("fileName", fileName);
	                fileMap.put("fileSize", multipartFile.getSize());
	                System.out.println("fileMap :"+fileMap);
	                multipartFile.transferTo(tmp);
	                if(count==0) {
	                	ImgFileDTO dto = new ImgFileDTO(0, fileSize, fileName,(String)session.getAttribute("id"),0, 0, 0,"true");
	                	isS = PBoardDAO.uploadImg(dto);
	                }else {
	                	ImgFileDTO dto = new ImgFileDTO(0, fileSize, fileName,(String)session.getAttribute("id"),0, 0, 0,"false");
	                	isS = PBoardDAO.uploadImg(dto);
	                }
	                count++;
	      
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

	@Override
	public int serachId(String id, int pseq) {
		// TODO Auto-generated method stub
		return PBoardDAO.searchId(id,pseq);
	}

	@Override
	public List<StockDTO> getListType(String ptype) {
		// TODO Auto-generated method stub
		return PBoardDAO.getListType(ptype);
	}

	@Override
	public Map<String, Object> getDetailUpdateForm(int pseq) {
		// TODO Auto-generated method stub
		return PBoardDAO.getDetailUpdateForm(pseq);
	}

	@Override
	public void updateBoard(PBoardDTO dto, int[] pnum, List<POptionDTO> optionList, int mainNum, int pseq) {
		// TODO Auto-generated method stub
		PBoardDAO.updateBoard(dto, pnum, optionList,  mainNum,pseq);
	}

	@Override
	public Map<String, Object> mainPage() {
		// TODO Auto-generated method stub
		return PBoardDAO.mainPage();
	}

	@Override
	public RBoardDTO showAnsR(int rseq) {
		// TODO Auto-generated method stub
		return PBoardDAO.showAnsR(rseq);
	}

	@Override
	public QBoardDTO showAnsQ(int qseq) {
		// TODO Auto-generated method stub
		return PBoardDAO.showAnsQ(qseq);
	}

	@Override
	public boolean updateImg(int pseq,HttpServletRequest request, List<MultipartFile> uploadFiles) {
		 Map<String,Object>fileMap=new HashMap<String,Object>();
		 HttpSession session = request.getSession();
		 boolean isS = false;
	        for(int i=0;i<uploadFiles.size();i++) {
	            try {
	               String fileName=uploadFiles.get(i).getOriginalFilename();
	               String path2=request.getSession().getServletContext().getRealPath("upload");
	               System.out.println(path2);
	                File tmp=new File(path2+"/"+fileName);
	                int fileSize=(int)uploadFiles.get(i).getSize();
	                fileMap.put("fileName", fileName);
	                fileMap.put("fileSize", uploadFiles.get(i).getSize());
	                System.out.println("fileMap :"+fileMap);
	                uploadFiles.get(i).transferTo(tmp);
	                System.out.println("??????????????????????????? ????????????????");
	                if(pseq!=0) {
	                	ImgFileDTO dto = new ImgFileDTO(0, fileSize, fileName,(String)session.getAttribute("id"), pseq, 0, 0,"true");
	                	isS = PBoardDAO.uploadImg(dto);
	                }else {
	                	ImgFileDTO dto = new ImgFileDTO(0, fileSize, fileName,(String)session.getAttribute("id"), 0, 0, 0,"true");
	                	isS = PBoardDAO.uploadImg(dto);
	                }
	            }
	            catch(Exception e){
	                return false;
	            }
	            System.out.println("isS : "+isS);
	    }
	        return isS;
	}

	
	
}
