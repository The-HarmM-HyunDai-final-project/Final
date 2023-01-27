package com.theharmm.showlive;

import java.util.Date;

//웹소켓 통신중 롬복에서 오류발생 가능성존재하기 떄문에 직접 getter/setter 구현
public class ShowLiveMessage {
	private String roomNo;
	private String userName;
	private String message;
//	private String questionYn;
	private Date insertDate;
	private MessageType mType;
	private int channelTotalUser;
	private String channelMaxSuggestUser;
	private int channelMaxSuggestPrice;

	public ShowLiveMessage() {
		insertDate = new java.util.Date();
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getUsername() {
		return userName;
	}

	public void setUsername(String userName) {
		this.userName = userName;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
//	public String getQuestionYn() {
//		return questionYn;
//	}
//	
//	public void setQuestionYn(String questionYn) {
//		this.questionYn = questionYn;
//	}
	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public MessageType getType() {
		return mType;
	}

	public void setType(MessageType mType) {
		this.mType = mType;
	}

	public int getChannelTotalUser() {
		return channelTotalUser;
	}

	public void setChannelTotalUser(int channelTotalUser) {
		this.channelTotalUser = channelTotalUser;
	}

	
	public String getChannelMaxSuggestUser() {
		return channelMaxSuggestUser;
	}

	public void setChannelMaxSuggestUser(String channelMaxSuggestUser) {
		this.channelMaxSuggestUser = channelMaxSuggestUser;
	}

	public int getChannelMaxSuggestPrice() {
		return channelMaxSuggestPrice;
	}

	public void setChannelMaxSuggestPrice(int channelMaxSuggestPrice) {
		this.channelMaxSuggestPrice = channelMaxSuggestPrice;
	}

	@Override
	public String toString() {
		return "ChatMessage [roomNo=" + roomNo + ", userName=" + userName + ", message=" + message + ", insertDate="
				+ insertDate + ", mType=" + mType + ", channelTotalUser=" + channelTotalUser + ", channelMaxSuggestUser="
				+ channelMaxSuggestUser + ", channelMaxSuggestPrice=" + channelMaxSuggestPrice + "]";
	}
}
