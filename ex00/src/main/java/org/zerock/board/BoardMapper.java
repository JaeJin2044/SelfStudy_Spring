package org.zerock.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.zerock.board.domain.BoardVO;
import org.zerock.board.domain.Criteria;

@Mapper
public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public void insertSelectKey(BoardVO board);
	
	//글 작성 
	public int write(BoardVO board);
	
	//디테일 
	public BoardVO selOne(BoardVO board);
	
	//글 삭제 
	public int delete(BoardVO board);
	
	//글 수정 
	public int edit(BoardVO board);
	
	//페이징
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	//총 게시물 수 
	public int totalCount(Criteria cri);
	
	
}
