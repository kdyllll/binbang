package com.binbang.member.model.service;

import static com.binbang.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.binbang.member.model.dao.MemberDao;
import com.binbang.member.model.vo.Member;
import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.commit;
import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.rollback;

public class MemberService {

	private MemberDao dao=new MemberDao();

	//로그인

	public Member selectMember(String email, String password) {
		Connection conn=getConnection();
		Member m=dao.selectMember(conn,email,password);
		close(conn);
		return m;
	}
	
	//회원가입
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//중복확인
	
	
	//mypage 조회
	
	//mypage 수정
	
	//mypage 탈퇴
	
	//mypage 비밀번호수정
}
