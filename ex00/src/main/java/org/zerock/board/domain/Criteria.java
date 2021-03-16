package org.zerock.board.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Criteria")
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	

}
