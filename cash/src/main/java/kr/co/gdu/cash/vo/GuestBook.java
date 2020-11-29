package kr.co.gdu.cash.vo;

public class GuestBook {
	private int guestBookId;
	private String guestBookContent;
	private String guestBookWriter;
	private String guestBookDate;
	
	public int getGuestBookId() {
		return guestBookId;
	}
	public void setGuestBookId(int guestBookId) {
		this.guestBookId = guestBookId;
	}
	public String getGuestBookContent() {
		return guestBookContent;
	}
	public void setGuestBookContent(String guestBookContent) {
		this.guestBookContent = guestBookContent;
	}
	public String getGuestBookWriter() {
		return guestBookWriter;
	}
	public void setGuestBookWriter(String guestBookWriter) {
		this.guestBookWriter = guestBookWriter;
	}
	public String getGuestBookDate() {
		return guestBookDate;
	}
	public void setGuestBookDate(String guestBookDate) {
		this.guestBookDate = guestBookDate;
	}
	
	@Override
	public String toString() {
		return "GuestBook [guestBookId=" + guestBookId + ", guestBookContent=" + guestBookContent + ", guestBookWriter="
				+ guestBookWriter + ", guestBookDate=" + guestBookDate + "]";
	}
}
