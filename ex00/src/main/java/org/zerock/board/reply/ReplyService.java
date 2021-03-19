package org.zerock.board.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.board.domain.Criteria;
import org.zerock.board.domain.ReplyVO;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyMapper mapper;
	
	//댓글 읽기
	public ReplyVO read(long rno) {
		
		return mapper.read(rno);
	}
	//댓글 리스트
	public List<ReplyVO> getListWithPaging(Criteria cri , long bno){
		
		return mapper.getListWithPaging(cri, bno);
	}
	
	//댓글 삭제
	public int delete(long rno) {
		return mapper.delete(rno);
	}
	
	//댓글 수정
	public int update(ReplyVO reply) {
		return mapper.update(reply);
	}
	
	//댓글 생성
	public int insert(ReplyVO reply) {
		return mapper.insert(reply);
	}
	
	
	
	

}
