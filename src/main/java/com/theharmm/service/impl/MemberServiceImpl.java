package com.theharmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theharmm.domain.MemberAuthVO;
import com.theharmm.domain.MemberVO;
import com.theharmm.mapper.MemberMapper;
import com.theharmm.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;

	//회원가입 시 member, authorities 테이블에 값을 넣기 때문에 하나의 작업단위로 묶어야 하기 때문에 Transaction 묶음!
	@Transactional
	@Override
	public int joinMember(MemberVO member) {
		MemberAuthVO auth = new MemberAuthVO();
		auth.setUsername(member.getMember_email());
		auth.setAuthority("ROLE_MEMBER");
		
		int result1 = mapper.joinMember(member);
		int result2 = mapper.joinMemberAuthority(auth);
		if( result1 == 1 && result2 == 1) {
			log.info("회원가입이 잘 되었습니당");
		}
		
		return result1 + result2;
	}
	//회원가입 시 member, authorities 테이블에 값을 넣기 때문에 하나의 작업단위로 묶어야 하기 때문에 Transaction 묶음!
	@Transactional
	@Override
	public int joinAdminMember(MemberVO admin) {
		MemberAuthVO auth1 = new MemberAuthVO();
		auth1.setUsername(admin.getMember_email());
		auth1.setAuthority("ROLE_MEMBER");
		
		MemberAuthVO auth2 = new MemberAuthVO();
		auth2.setUsername(admin.getMember_email());
		auth2.setAuthority("ROLE_ADMIN");
		
		List<MemberAuthVO> authList = new ArrayList<MemberAuthVO>();
		authList.add(auth1);
		authList.add(auth2);
		
		int result1 = mapper.joinMember(admin);
		int result2 = mapper.joinAdminMemberAuthority(authList);
		
		if( result1 == 1 && result2 > 1) {
			log.info("회원가입이 잘 되었습니당");
		}
		
		return result1 + result2;
	}
	//회원가입 시 email이 pid이기 때문에 중복 검사 진행 !
	@Override
	public int checkEmail(MemberVO member) {
		return mapper.checkEmail(member);
	}
	//회원가입 시 nickname이 unique이기 때문에 중복 검사 진행 !
	@Override
	public int checkNickName(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.checkNickName(member);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}
	//시큐리티에서 멤버 정보 가져와서 인증 처리하니까 id값으로 member 정보 가져올수 있는 메소드 정의 !
	@Override
	public MemberVO read(MemberVO member) {
		return mapper.read(member);
	}
	
	@Override
	public void updateLogin(MemberVO member) {
		mapper.updateLoign(member);
	}
	
}
