package kr.co.gdu.cash.vo;

public class NoticeComment {
	private int noticeCommentId;
	private int noticeId;
	private String noticeCommentContent;

	public int getNoticeCommentId() {
		return noticeCommentId;
	}
	public void setNoticeCommentId(int noticeCommentId) {
		this.noticeCommentId = noticeCommentId;
	}
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeCommentContent() {
		return noticeCommentContent;
	}
	public void setNoticeCommentContent(String noticeCommentContent) {
		this.noticeCommentContent = noticeCommentContent;
	}
	
	@Override
	public String toString() {
		return "NoticeComment [noticeCommentId=" + noticeCommentId + ", noticeId=" + noticeId
				+ ", noticeCommentContent=" + noticeCommentContent + "]";
	}
}
