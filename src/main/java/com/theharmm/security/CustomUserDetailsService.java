package com.theharmm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.theharmm.domain.MemberVO;
import com.theharmm.mapper.MemberMapper;
import com.theharmm.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper member;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		MemberVO m = new MemberVO();
		m.setMember_email(username);
		
		
//		log.warn("Query by username :" + username);
		MemberVO vo = member.read(m);		
		log.warn(vo.toString());
//		log.warn("Query by memebr maper :" +vo);
			
		//���׽�
		return ( vo == null 
				? null 
				: new CustomUser(vo) );
	}
}
