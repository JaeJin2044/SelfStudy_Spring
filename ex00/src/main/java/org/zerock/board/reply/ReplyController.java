package org.zerock.board.reply;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.board.domain.Criteria;
import org.zerock.board.domain.ReplyVO;

import lombok.AllArgsConstructor;


@RestController
@RequestMapping("/reply")
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	//댓글 생성
	@PostMapping(value="/new", consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		
		int insertCount = service.insert(vo);
		
		return insertCount == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	//댓글 리스트
	@GetMapping(value="/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("page") int page, 
			@PathVariable("bno") Long bno){
		

		Criteria cri = new Criteria(page,10);
		return new ResponseEntity<>(service.getListWithPaging(cri, bno),HttpStatus.OK);
	}
	
	//댓글 조회 
	@GetMapping(value="/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") long rno){
		return new ResponseEntity<>(service.read(rno),HttpStatus.OK);
		
	}
	
	//댓글 삭제
	@DeleteMapping(value="/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") long rno){
		
		return service.delete(rno) == 1 ? new ResponseEntity<String>("success",HttpStatus.OK) : 
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	//댓글 수정
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@PathVariable("rno") long rno, @RequestBody ReplyVO vo){
		
		vo.setRno(rno);
		
		return service.update(vo) == 1 ? new ResponseEntity<String>("success",HttpStatus.OK) : 
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		
	}
	
	
	
	
}













