package com.theharmm.domain;

import java.util.List;

public class PostVO {
	/* 포스트 id */
	private int post_id;
	
	/* 회원이메일 */
	private String member_email;
	
	/* 경로 */
	private String upload_path;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String file_name;
	
	public String getMember_email() {
		return member_email;
	}
	
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	
	public String getUpload_path() {
		return upload_path;
	}

	public void setUpload_path(String upload_path) {
		this.upload_path = upload_path;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	/* 이미지 정보 */
	private List<SocialVO> socialList;
	
	public List<SocialVO> getSocialList() {
		return socialList;
	}
	
	public void setSocialList(List<SocialVO> socialList) {
		this.socialList = socialList;
	}
	
	@Override
	public String toString() {
		return "SocialDTO [socialList=" + socialList + "]";
	}

}
