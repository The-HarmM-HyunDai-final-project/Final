package com.theharmm.auth;

public interface SnsUrls {
	//사용자 접근권한을 받는 주소
	static final String NAVER_ACCESS_TOKEN = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	//네이버 사용자 동의란 뜨는 주소
	static final String NAVER_AUTH = "https://nid.naver.com/oauth2.0/authorize";
	static final String NAVER_PROFILE_URL = "https://openapi.naver.com/v1/nid/me";
}