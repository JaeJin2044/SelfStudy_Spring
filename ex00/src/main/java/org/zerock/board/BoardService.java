package org.zerock.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.board.domain.BoardVO;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	//리스트
	public List<BoardVO> getList(){
		return mapper.getList();
	}
	
}






