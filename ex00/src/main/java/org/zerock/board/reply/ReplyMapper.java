package org.zerock.board.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.zerock.board.domain.Criteria;
import org.zerock.board.domain.ReplyVO;

@Mapper
public interface ReplyMapper {

	//댓글 생성
	public int insert(ReplyVO reply);
	
	//댓글 보기
	public ReplyVO read(long rno);
	
	//댓글 삭제
	public int delete(long rno);
	
	//댓글 수정
	public int update(ReplyVO reply);
	
	//댓글 리스트
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
}
