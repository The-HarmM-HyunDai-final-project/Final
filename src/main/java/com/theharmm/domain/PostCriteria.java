package com.theharmm.domain;

import java.util.Arrays;

public class PostCriteria {

	/* 현재 페이지 번호 */
	private int pageNum;
	
	/* 페이지 표시 개수 */
	private int amount;
	
	/* 검색 타입 */
	private String type;
	
	/* 검색 키워드 */
	private String keyword;
	
	/* 포스트 리스트 */
	private String[] postArr;
		
	/* 포스트 번호(댓글 기능에서 사용) */
	private int post_id;
	
	/* Criteria 생성자 */
	public PostCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	/* Criteria 기본 생성자 */
	public PostCriteria(){
		this(1,10);
	}
	
	/* 검색 타입 데이터 배열 변환 */
	public String[] getTypeArr() {
		return type == null? new String[] {}:type.split("");
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String[] getPostArr() {
		return postArr;
	}

	public void setPostArr(String[] postArr) {
		this.postArr = postArr;
	}

	
	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword
				+ ", postArr=" + Arrays.toString(postArr) + ", post_id=" + post_id + "]";
	}
}