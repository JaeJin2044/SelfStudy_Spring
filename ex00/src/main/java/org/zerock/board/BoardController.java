package org.zerock.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.board.domain.BoardVO;
import org.zerock.board.domain.Criteria;
import org.zerock.board.domain.PageDTO;
import org.zerock.board.utils.Const;

@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	
	@GetMapping("/list")
	public void list(Model model,Criteria cri) {
		System.out.println("한 페이지 출력 :"+cri.getAmount());
		System.out.println("페이지 nun:"+cri.getPageNum());
		List<BoardVO> dbData = service.getList(cri);
		
		int total = service.totalCount(cri);
		
		total = 953;
		model.addAttribute(Const.KEY_LIST, dbData);
		model.addAttribute("page", new PageDTO(cri,total));
	}
	
	@GetMapping("/write")
	public void write() {
		
	}
	
	@PostMapping("/write")
	public String write(BoardVO param) {
		service.write(param);
		return "redirect:/board/list";
	}
	
	@GetMapping("/detail")
	public void detail(Model model ,BoardVO param) {
		model.addAttribute(Const.KEY_BOARD, service.selOne(param));
	}
	
	@GetMapping("/delete")
	public String delete(BoardVO param,@RequestParam("pageNum") String pageNum) {
		
		service.delete(param);
		return "redirect:/board/list?pageNum="+pageNum;
	}
	
	@GetMapping("/edit")
	public void edit(Model model ,BoardVO param) {
		model.addAttribute(Const.KEY_BOARD, service.selOne(param));
	}
	
	@PostMapping("/edit")
	public String edit(BoardVO param,Model model, RedirectAttributes rrtr,@RequestParam("pageNum") String pageNum) {
		System.out.println(param.getBno());
		System.out.println(param.getTitle());
		System.out.println(param.getWriter());
		
		int result = service.edit(param);
		if(result ==1) {
			System.out.println("수정 성공");
			rrtr.addFlashAttribute("msg", "성공");
		}else {
			System.out.println("수정 실패 ");
			rrtr.addFlashAttribute("msg", "fail");
		}
		
		return "redirect:/board/list?pageNum="+pageNum;
	}
}










