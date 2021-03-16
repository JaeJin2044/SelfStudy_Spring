package org.zerock.board.domain;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev , next;
	
	private int total;
	private Criteria cri;
	
	private int realEnd;
	private int realStart;
	
	
	
	public PageDTO(Criteria cri,int total) {
		
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0) *10);
		this.startPage = this.endPage - 9 ;
		
		this.realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		System.out.println("realEnd = "+this.realEnd);
		if(this.realEnd < this.endPage) {
			this.endPage = this.realEnd;
		}
		
		this.prev = startPage > 1 ;
		this.next = this.endPage < realEnd;
		
		if(this.startPage >= 1) {
			this.realStart = 1;
		}
		
	}
	
}
