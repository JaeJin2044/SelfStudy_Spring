package org.zerock.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.zerock.board.domain.BoardVO;

@Mapper
public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	

}
