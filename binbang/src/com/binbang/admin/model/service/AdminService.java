package com.binbang.admin.model.service;

import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.rollback;
import static com.binbang.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.binbang.admin.model.dao.AdminDao;
import com.binbang.host.model.vo.Host;
import com.binbang.member.model.vo.Member;

public class AdminService {
	
	private AdminDao dao=new AdminDao();
	
	//회원 전체 리스트
	public List<Member> selectMemberAll() {
		Connection conn=getConnection();
		List<Member> list=dao.memberList(conn);
		close(conn);
		return list;
	}
	
	//호스트 승인 리스트
	public List<Host> acceptHostList(){
		Connection conn=getConnection();
		List<Host> list=dao.hostAcceptList(conn);
		close(conn);
		return list;
	}
	
	//호스트 승인으로 값 바꾸기
	public int acceptHost(String memberNo) {
		Connection conn=getConnection();
		int result=dao.hostAccept(conn,memberNo);
		if(result>0) close(conn);
		else rollback(conn);
		return result;
	}

}
