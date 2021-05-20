package com.luna.board.dtos;


import java.util.Date;

public class PBoardDTO {
	private int pseq;
	private String pcontent;
	private Date pdate;
	private String ptitle;
	private ImgFileDTO image;
	private StockDTO stock;
	private int hit;
	
	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public StockDTO getStock() {
		return stock;
	}

	public void setStock(StockDTO stock) {
		this.stock = stock;
	}

	public ImgFileDTO getImage() {
		return image;
	}

	public void setImage(ImgFileDTO image) {
		this.image = image;
	}

	public PBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PBoardDTO(int pseq, String pcontent, Date pdate, String ptitle) {
		super();
		this.pseq = pseq;
		this.pcontent = pcontent;
		this.pdate = pdate;
		this.ptitle = ptitle;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	@Override
	public String toString() {
		return "PBoardDTO [pseq=" + pseq + ", pcontent=" + pcontent + ", pdate=" + pdate + ", ptitle=" + ptitle + "]";
	}
	
}
