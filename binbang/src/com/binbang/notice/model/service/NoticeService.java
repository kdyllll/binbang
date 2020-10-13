package com.binbang.notice.model.service;

import java.sql.Connection;
import java.util.List;

import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.commit;
import static com.binbang.common.JDBCTemplate.rollback;
import com.binbang.notice.model.dao.NoticeDao;
import com.binbang.notice.model.vo.Notice;

public class NoticeService {
	
	private NoticeDao dao=new NoticeDao();
	
	public List<Notice> noticeList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Notice> list=dao.noticeList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
		
	public int noticeCount(){
		Connection conn=getConnection();
		int count=dao.noticeCount(conn);
		close(conn);
		return count;
	}

	public Notice noticeDatailView(String noticeNo) {
		Connection conn=getConnection();
		Notice n=dao.noticeDatailView(conn, noticeNo);
		close(conn);
		return n;
	}
	
	public int insertNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.insertNotice(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int noticeUpdate(Notice n) {
		Connection conn=getConnection();
		int result=dao.noticeUpdate(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int noticeDelete(String noticeNo) {
		Connection conn=getConnection();
		int result=dao.noticeDelete(conn, noticeNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//이전글
	public Notice prevNotice(String noticeNo) {
		Connection conn=getConnection();
		Notice n=dao.prevNotice(conn, noticeNo);
		close(conn);
		return n;
	}
	
	//다음글
	public Notice nextNotice(String noticeNo) {
		Connection conn=getConnection();
		Notice n=dao.nextNotice(conn, noticeNo);
		close(conn);
		return n;
	}
	
}
