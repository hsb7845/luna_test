package com.luna.board.dtos;

public class ImgFileDTO {

	private int imgnum;
	private int  filesize;
	private String imgname;
	private String id;
	private int pseq;
	private int rseq;
	private int eseq;
	public int getImgnum() {
		return imgnum;
	}
	public void setImgnum(int imgnum) {
		this.imgnum = imgnum;
	}
	public int  getFilesize() {
		return filesize;
	}
	public void setFilesize(int  filesize) {
		this.filesize = filesize;
	}
	public String  getImgname() {
		return imgname;
	}
	public void setImgname(String  imgname) {
		this.imgname = imgname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public int getEseq() {
		return eseq;
	}
	public void setEseq(int eseq) {
		this.eseq = eseq;
	}
	@Override
	public String toString() {
		return "ImgFileDTO [imgnum=" + imgnum + ", filesize=" + filesize + ", imgname=" + imgname + ", id=" + id
				+ ", pseq=" + pseq + ", rseq=" + rseq + ", eseq=" + eseq + "]";
	}
	public ImgFileDTO(int imgnum, int  filesize, String imgname, String id, int pseq, int rseq, int eseq) {
		super();
		this.imgnum = imgnum;
		this.filesize = filesize;
		this.imgname = imgname;
		this.id = id;
		this.pseq = pseq;
		this.rseq = rseq;
		this.eseq = eseq;
	}
	public ImgFileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
