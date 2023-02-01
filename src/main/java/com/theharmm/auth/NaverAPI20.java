package com.theharmm.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI20 extends DefaultApi20 implements SnsUrls {
	private NaverAPI20() {
	}
	
	private static class InstanceHolder {
		private static final NaverAPI20 INSTANCE = new NaverAPI20();
	}
	
	public static NaverAPI20 instance() {
		return InstanceHolder.INSTANCE;
	}
	
	//사용자 접근권한을 받는 주소
	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	}
	
	//네이버 사용자 동의란 뜨는 주소
	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
	
	
}