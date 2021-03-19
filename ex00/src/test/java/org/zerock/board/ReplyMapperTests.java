package org.zerock.board;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.board.domain.Criteria;
import org.zerock.board.domain.ReplyVO;
import org.zerock.board.reply.ReplyMapper;

import lombok.extern.log4j.Log4j;


@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private long[] bnoArr = {2722,2721,2707,2706,};
	
	
	
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void testCreate() {
		
			ReplyVO vo = new ReplyVO();
			
			vo.setBno(272);
			vo.setReply("테스트용");
			vo.setReplyer("김상혁");
			
			mapper.insert(vo);
	}
	
	@Test
	public void readTest() {
		
		long testNum = 2721L;
		
		ReplyVO vo =  mapper.read(testNum);
		log.info(vo);
		
	}
	
	@Test
	public void deleteTest() {
		int testNum = 5;
		
		int result = mapper.delete(testNum);
		log.info(result);
	}
	
	@Test
	public void updateTest() {
		
		ReplyVO vo = new ReplyVO();
		vo.setRno(0);
		vo.setReply("안녕하세요 이재진입니다.");
		int result = mapper.update(vo);
		
		log.info(result);
	}
	
	
	@Test
	public void getReadTest() {
		Criteria cri = new Criteria();
		long testNum = 2722;
		
		List<ReplyVO> vo = mapper.getListWithPaging(cri, testNum);
		
		vo.forEach(reply -> log.info(reply));
	}
	
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	
	
	
	
	
}
