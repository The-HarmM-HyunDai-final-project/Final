package com.theharmm.auth;

import java.util.Iterator;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.theharmm.domain.MemberVO;
import com.theharmm.util.JoinUtil;

public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());
		
		this.sns = sns;
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public MemberVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

	private MemberVO parseJson(String body) throws Exception {
		System.out.println("============================\n" + body + "\n==================");
		MemberVO member = new MemberVO();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String curdate = JoinUtil.builder().build().GetCurDate();// 회원가입한 날짜를 넣기위한 커스텀 유틸 메서드
		
		if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			//member.setNaverid(resNode.get("email").asText());
			//member.setNickname(resNode.get("nickname").asText());
			member.setMember_email(resNode.get("email").asText());
			member.setMember_grade("BRONZE");
			
			member.setMember_password("1234");
			member.setMember_name(resNode.get("email").asText());
			member.setMember_nickname(resNode.get("email").asText());
			member.setMember_phone("01000000000");
			member.setMember_shoes_size(260);
			
			member.setMember_register(curdate);
			member.setMember_login(curdate);
			member.setMember_messege_info("true");
			member.setMember_email_info("true");
			
			String password = scpwd.encode(member.getMember_password());
			member.setMember_password(password);
		}
		
		return member;
	}
	
	
}