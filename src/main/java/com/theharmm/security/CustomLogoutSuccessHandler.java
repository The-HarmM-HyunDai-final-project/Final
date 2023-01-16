package com.theharmm.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		log.info("-----------------------------------------------------------¾Æ³ö");
		if (authentication != null && authentication.getDetails() != null) {
            try {
                 request.getSession().invalidate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
		
		String prevPage = request.getHeader("Referer");
		String uri = "/";
		if(prevPage != null) {
			uri = prevPage;
		}
		
        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect(uri);
	}

}
