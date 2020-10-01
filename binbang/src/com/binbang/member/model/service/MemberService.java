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
	
	//아이디 찾기
	public String findId(String name,String phone) {
		Connection conn=getConnection();
		String email=dao.selectEmail(conn,name,phone);
		close(conn);
		return email;
	}
	
	//비밀번호 찾기
//	public Member findPassword(String email) {
//		Connection conn=getConnection();
//		Member m=dao.findPassword(conn,email);
//		close(conn);
//		return m;
//	}
	
	//중복확인
	
	
	//mypage 조회
	
	//mypage 수정
	
	//mypage 탈퇴
	
	//로그인 화면 비밀번호수정용
	public int findPassword(String email,String newPassword) {
		Connection conn=getConnection();
		int result=-1;
		Member m=dao.selectMemberId(conn, email);
		
		if(m!=null) {
			result=dao.updatePassword(conn,email,newPassword);
			if(result>0) commit(conn);
			else rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//마이페이지 비밀번호 수정용
	public int updatePassword(String email,String password,String newPassword) {
		Connection conn=getConnection();
		int result=-1;
		Member m=dao.selectMember(conn, email, password);
		
		if(m!=null) {
			result=dao.updatePassword(conn,email,newPassword);
			if(result>0) commit(conn);
			else rollback(conn);
		}
		close(conn);
		return result;
		
	}
}
