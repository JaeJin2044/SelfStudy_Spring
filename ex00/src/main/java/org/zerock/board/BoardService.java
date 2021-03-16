package org.zerock.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.board.domain.BoardVO;
import org.zerock.board.domain.Criteria;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	//리스트
	public List<BoardVO> getList(Criteria cri){
		return mapper.getListWithPaging(cri);
	}
	
	//글작성 
	public int write(BoardVO param) {
		return mapper.write(param);
	}
	
	//디테일
	public BoardVO selOne(BoardVO param) {
		return mapper.selOne(param);
	}
	
	//글삭제 
	public int delete(BoardVO param) {
		return mapper.delete(param);
	}
	
	//글 수정 
	public int edit(BoardVO param) {
		return mapper.edit(param);
	}
	
	//총 게시물 수 
	public int totalCount(Criteria cri) {
		return mapper.totalCount(cri);
	}
	
}






