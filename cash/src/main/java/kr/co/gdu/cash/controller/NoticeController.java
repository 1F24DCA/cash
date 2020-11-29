package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.CashApplication;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	// 공지 목록
	@GetMapping("/admin/noticeList")
	public String noticeList(Model model,
							@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
							@RequestParam(value = "rowPerPage", defaultValue = "5") int rowPerPage) {
		Map<String, Object> map = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		
		List<Notice> noticeList = (List<Notice>)map.get("noticeList");
		int lastPage = (int)map.get("lastPage");
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("lastPage", lastPage);
		return "noticeList";
	}
	// 공지 입력 폼
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	// 공지 입력 액션
	@PostMapping("/admin/addNotice")
	public String addNotice(NoticeForm noticeForm) {
		noticeService.addNotice(noticeForm);
		return "redirect:/admin/noticeList";
	}
	// 공지 상세 보기
	@GetMapping("/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model, @PathVariable(value="noticeId") int noticeId, HttpServletRequest request) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		
		model.addAttribute("notice", notice);
		model.addAttribute("filePath", CashApplication.getFilePath(request));
		return "noticeOne";
	}
	// 공지 삭제
	@GetMapping("/admin/removeNotice/{noticeId}")
	public String removeNotice(@PathVariable(value="noticeId") int noticeId) {
		noticeService.removeNotice(noticeId);
		return "redirect:/admin/noticeList";
	}
	// 공지 수정 폼
	@GetMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Model model, @PathVariable(value="noticeId") int noticeId, HttpServletRequest request) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		
		model.addAttribute("notice", notice);
		model.addAttribute("filePath", CashApplication.getFilePath(request));
		return "modifyNotice";
	}
	// 공지 수정 액션
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(NoticeForm noticeForm) {
		noticeService.modifyNotice(noticeForm);
		return "redirect:/admin/noticeOne/"+noticeForm.getNoticeId();
	}
}
