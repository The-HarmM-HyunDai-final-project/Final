package com.theharmm.domain;

public class SocialVO {

	/* 경로 */
	private String upload_path;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String file_name;
	
	/* 포스트 id */
	private int post_id;
	
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

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	@Override
	public String toString() {
		return "SoicalVO [upload_path=" + upload_path + ", uuid=" + uuid + ", file_name=" + file_name + ", post_id="
				+ post_id + "]";
	}
	
	
}