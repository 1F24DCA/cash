package kr.co.gdu.cash.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.GuestBookService;
import kr.co.gdu.cash.vo.GuestBook;

@Controller
public class GuestBookController {
	@Autowired private GuestBookService guestBookService;
	
	@GetMapping("/admin/guestBook")
	public String guestBook(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		Map<String, Object> map = guestBookService.getGuestBookList(currentPage);
		
		model.addAttribute("map", map);
		return "guestBook";
	}
	
	@PostMapping("/admin/createGuestBook")
	public String createGuestBook(GuestBook guestBook) {
		guestBookService.addGuestBook(guestBook);
		
		return "redirect:/admin/guestBook";
	}
	
	@GetMapping("/admin/removeGuestBook/{guestBookId}")
	public String removeGuestBook(@PathVariable(value="guestBookId") int guestBookId) {
		guestBookService.removeGuestBook(guestBookId);
		
		return "redirect:/admin/guestBook";
	}
}
