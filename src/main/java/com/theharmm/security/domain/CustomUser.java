
package com.theharmm.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.theharmm.domain.MemberVO;

import lombok.Data;
import lombok.Getter;

//@Getter
@Data
public class CustomUser  extends User{
	
	//Serialization
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	private String roomNo;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}//end CustomUser...
	
	public CustomUser(MemberVO vo) {
		
		super(vo.getMember_email()
	         ,vo.getMember_password()
			 ,vo.getAuthList()
			  .stream()
			  .map( auth -> new SimpleGrantedAuthority(auth.getAuthority()))
			  .collect(Collectors.toList())				
		);//end super
		
		this.member = vo;
		
	}//end CustomUser

}//end class
