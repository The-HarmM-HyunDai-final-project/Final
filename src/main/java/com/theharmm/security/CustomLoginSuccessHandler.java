package com.theharmm.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.theharmm.mapper.MemberMapper;
import com.theharmm.mapper.PostMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    private final RequestCache requestCache = new HttpSessionRequestCache();
    private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
    
    @Autowired
    private MemberMapper memberMapper;
    
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		log.warn("Login Success, Hello! "+ auth.getName());
		memberMapper.updateLoign(auth.getName());
		clearSession(request);
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        
        String prevPage = (String) request.getSession().getAttribute("prevPage");
        if (prevPage != null) {
            request.getSession().removeAttribute("prevPage");
        }

        // �⺻ URI
        String uri = "/";
        
        if (savedRequest != null) {
            uri = savedRequest.getRedirectUrl();
        } else if (prevPage != null && !prevPage.equals("")) {
            //이전페이지가 회원가입이거나 로그인페이지 일떄는 그냥 홈으로 가버려리게!
            if (prevPage.contains("/member/join") || prevPage.contains("/member/loginpage")) {
                uri = "/";
            } else {
                uri = prevPage;
            }
        }

        redirectStrategy.sendRedirect(request, response, uri);
        
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {

			roleNames.add(authority.getAuthority());

		});//end auth.getAuthorities

		log.warn("������ ����: " + roleNames);

	}//end onAuthenticationSuccess
	
    protected void clearSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        }
    }//end clearSession
    
}//end class
