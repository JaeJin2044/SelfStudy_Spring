package org.zerock.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.board.domain.BoardVO;
import org.zerock.board.utils.Const;

@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	
	@GetMapping("/list")
	public void list(Model model) {
		List<BoardVO> dbData = service.getList();
		model.addAttribute(Const.KEY_LIST, dbData);
	}
}
