package com.theharmm.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    private final RequestCache requestCache = new HttpSessionRequestCache();
    private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
    
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		log.warn("Login Success, Hello! "+ auth.getName());

		clearSession(request);
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        
        /**
         * prevPage�� �����ϴ� ��� = ����ڰ� ���� /member/loginpage ��η� �α��� ��û
         * ���� Session�� prevPage attribute ����( ���� url �������ϱ� �ʿ������ ����)
         */
        String prevPage = (String) request.getSession().getAttribute("prevPage");
        if (prevPage != null) {
            request.getSession().removeAttribute("prevPage");
        }

        // �⺻ URI
        String uri = "/";
        
        /**
         * savedRequest �����ϴ� ��� = ���� ������ ���� ������ ���� (�̰Թ�������?)
         * Security Filter�� ���ͼ�Ʈ�Ͽ� savedRequest�� ���� ���� (���ͼ�Ʈ�ؼ� ������ ������ �ᱹ ������ �ʿ��ؼ� �α����� �ߴٴ°� ! -> �׷� ���� url�� �־����)
         */
        if (savedRequest != null) {
            uri = savedRequest.getRedirectUrl();
        } else if (prevPage != null && !prevPage.equals("")) {
            // ȸ������ - �α������� �Ѿ�� ��� "/"�� redirect
            if (prevPage.contains("/member/join")) {
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

//		response.sendRedirect("/");
		
//		if (roleNames.contains("ROLE_ADMIN")) {
//			response.sendRedirect("/sample/admin");
//			return;
//		}//end if
//
//		if (roleNames.contains("ROLE_MEMBER")) {
//			response.sendRedirect("/sample/member");
//			return;
//		}//end if


	}//end onAuthenticationSuccess
	
    // �α��� ���� �Ŀ� ���� �� �����ִ� ���� ���� ����
    protected void clearSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        }
    }//end clearSession
    
}//end class
