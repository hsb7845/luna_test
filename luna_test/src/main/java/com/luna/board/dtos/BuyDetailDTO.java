package com.luna.board.dtos;

public class BuyDetailDTO {
	private int bdseq;
	private int pseq;
	private int pcount;
	private int bseq;
	private String selOpt;
	private int price;
	private ImgFileDTO image;
	private BuyListDTO blDTO;
	private PBoardDTO pboard;

	
	public ImgFileDTO getImage() {
		return image;
	}
	public void setImage(ImgFileDTO image) {
		this.image = image;
	}
	public BuyListDTO getBlDTO() {
		return blDTO;
	}
	public void setBlDTO(BuyListDTO blDTO) {
		this.blDTO = blDTO;
	}
	public PBoardDTO getPboard() {
		return pboard;
	}
	public void setPboard(PBoardDTO pboard) {
		this.pboard = pboard;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getSelOpt() {
		return selOpt;
	}
	public void setSelOpt(String selOpt) {
		this.selOpt = selOpt;
	}
	public BuyDetailDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuyDetailDTO(int bdseq, int pseq, int pcount, int bseq) {
		super();
		this.bdseq = bdseq;
		this.pseq= pseq;
		this.pcount = pcount;
		this.bseq = bseq;
	}
	public int getBdseq() {
		return bdseq;
	}
	public void setBdseq(int bdseq) {
		this.bdseq = bdseq;
	}
	
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	
}
