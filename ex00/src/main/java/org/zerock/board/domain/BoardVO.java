package org.zerock.board.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;


@Data
@Alias("BoardVO")
public class BoardVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
}
