package com.movieport.mapper;

import com.movieport.model.MemberVO;

public interface MemberMapper {
	// 회원가입
	public void memberJoin(MemberVO member);
	
	// 아이디 중복 검사
	public int idCheck(String id);
}
