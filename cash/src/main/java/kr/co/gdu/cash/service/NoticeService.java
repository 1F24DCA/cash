package kr.co.gdu.cash.service;

import java.io.File;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.CashApplication;
import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeCommentMapper;
import kr.co.gdu.cash.mapper.NoticeFileMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeFile;
import kr.co.gdu.cash.vo.NoticeForm;

@Service 
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private NoticeFileMapper noticeFileMapper;
	@Autowired private NoticeCommentMapper noticeCommentMapper;
	@Autowired private CashbookMapper cashbookMapper;
	
	public Notice getNoticeOne(int noticeId) {
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
	}
	
	public void addNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		notice.setNoticeDate(noticeForm.getNoticeDate());
		
		noticeMapper.insertNotice(notice);
		noticeForm.setNoticeId(notice.getNoticeId());
		
		insertNoticeFile(noticeForm);
	}
	
	public void modifyNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		notice.setNoticeDate(noticeForm.getNoticeDate());
		
		noticeMapper.updateNotice(notice);
		
		insertNoticeFile(noticeForm);
	}
	
	public void removeNotice(int noticeId) {
		List<NoticeFile> noticeFileList = noticeFileMapper.selectNoticeFileByNoticeId(noticeId);
		for (NoticeFile noticeFile : noticeFileList) {
			File file = new File(CashApplication.UPLOAD_PATH+noticeFile.getNoticeFileName());
			if (file.exists()) {
				file.delete();
			}
		}
		
		noticeCommentMapper.deleteNoticeCommentByNoticeId(noticeId);
		noticeFileMapper.deleteNoticeFileByNoticeId(noticeId);
		noticeMapper.deleteNotice(noticeId);
	}
	
	private void insertNoticeFile(NoticeForm noticeForm) {
		if (noticeForm.getNoticeFileList() != null) {
			for (MultipartFile multipartFile : noticeForm.getNoticeFileList()) {
				String fileName = UUID.randomUUID().toString().replace("-", "");
				String fileExtension = multipartFile.getOriginalFilename().replaceAll(".+(\\.\\w+)$", "$1").toLowerCase();
				String fileFullName = fileName+fileExtension;
				
				try {
					File file = new File(CashApplication.UPLOAD_PATH+fileFullName);
					multipartFile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
				
				NoticeFile noticeFile = new NoticeFile();
				noticeFile.setNoticeId(noticeForm.getNoticeId());
				noticeFile.setNoticeFileName(fileFullName);
				noticeFile.setNoticeFileType(multipartFile.getContentType());
				noticeFile.setNoticeFileSize(multipartFile.getSize());
				
				noticeFileMapper.insertNoticeFile(noticeFile);
			}
		}
	}
	
	public Map<String, Object> getNoticeListByPage(int currentPage, int rowPerPage) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("beginRow", (currentPage-1)*rowPerPage);
		paramMap.put("rowPerPage", rowPerPage);
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(paramMap);
		
		int noticeCount = noticeMapper.selectNoticeCount();
		int lastPage = noticeCount/rowPerPage;
		if (noticeCount%rowPerPage != 0) {
			lastPage += 1;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("lastPage", lastPage);
		return map;
	}
	
	// issue : noticeList....중복
	public Map<String, Object> getNoticeAndInOutList() { 
		List<Notice> noticeList = noticeMapper.selectLatestNoiceList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String, Object> map = new HashMap<String, Object>();
		
		Collections.reverse(inOutList);
		
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	public List<Notice> getNoticeList() {
		return noticeMapper.selectLatestNoiceList();
	}
}
