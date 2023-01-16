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
         * prevPage가 존재하는 경우 = 사용자가 직접 /member/loginpage 경로로 로그인 요청
         * 기존 Session의 prevPage attribute 제거( 이전 url 빼왔으니까 필요없으니 제거)
         */
        String prevPage = (String) request.getSession().getAttribute("prevPage");
        if (prevPage != null) {
            request.getSession().removeAttribute("prevPage");
        }

        // 기본 URI
        String uri = "/";
        
        /**
         * savedRequest 존재하는 경우 = 인증 권한이 없는 페이지 접근 (이게뭔말이지?)
         * Security Filter가 인터셉트하여 savedRequest에 세션 저장 (인터셉트해서 저장을 했으니 결국 권한이 필요해서 로그인을 했다는것 ! -> 그럼 이전 url이 있어야지)
         */
        if (savedRequest != null) {
            uri = savedRequest.getRedirectUrl();
        } else if (prevPage != null && !prevPage.equals("")) {
            // 회원가입 - 로그인으로 넘어온 경우 "/"로 redirect
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

		log.warn("계정의 역할: " + roleNames);

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
	
    // 로그인 실패 후에 성공 시 남아있는 에러 세션 제거
    protected void clearSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        }
    }//end clearSession
    
}//end class
