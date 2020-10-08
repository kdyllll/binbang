package com.binbang.member.model.service;

import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.commit;
import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.binbang.member.model.dao.MemberDao;
import com.binbang.member.model.vo.Favorite;
import com.binbang.member.model.vo.Member;


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

	//email중복확인
	public String emailCheck(String email) {
		Connection conn=getConnection();
		String result=dao.emailCheck(conn,email);
		close(conn);
		return result;
	}
	
	//mypage 비밀번호 확인
	public String selectPassword(String password) {
		Connection conn=getConnection();
		String result=dao.selectPassword(conn,password);
		close(conn);
		return result;
	}

	
	
	//mypage 조회
	public Member selectInfo(String email) {
		Connection conn=getConnection();
		Member m=dao.selectInfo(conn,email);
		close(conn);
		return m;
	}
	
	//mypage 수정
	public int updateMember(Member m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//mypage 탈퇴
	public int deleteMember(String email) {
		Connection conn=getConnection();
		int result=dao.deleteMember(conn, email);
		if(result>0) commit(conn);
		else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
	//mypage 비밀번호 수정
	public int updatePassword(String oriPw,String newPw , String email) {
		Connection conn=getConnection();
		int result=dao.updatePassword(conn, newPw, email);
		Member m=dao.selectMember(conn, email, oriPw);
		
		if(m!=null) {
			result=dao.updatePassword(conn,email,newPw);
			if(result>0) commit(conn);
			else rollback(conn);
		}
		close(conn);
		return result;		
	}
	
	
	
	
	//비밀번호수정
	public int findPassword(String email,String newPassword) {
		
		Connection conn=getConnection();
		int result=dao.updatePassword(conn,email,newPassword);
		System.out.println("서비스 : "+email);
		System.out.println("서비스 : "+newPassword);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	//관심숙소 리스트
	public List<Favorite> selectFavList(Member m){
		Connection conn=getConnection();
		List<Favorite> fList=dao.selectFavList(conn,m);
		close(conn);
		return fList;
	}
	
	
}
