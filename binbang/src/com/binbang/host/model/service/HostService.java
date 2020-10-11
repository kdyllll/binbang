package com.binbang.host.model.service;

import com.binbang.booking.model.vo.Booking;
import com.binbang.host.model.dao.HostDao;
import com.binbang.host.model.vo.Host;
import com.binbang.house.model.vo.Review;
import com.binbang.member.model.vo.Complaint;
import com.binbang.member.model.vo.Member;

import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.rollback;
import static com.binbang.common.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.List;

public class HostService {
	HostDao hdao = new HostDao();
	
	public int hostEnroll(Host h) {
		Connection conn = getConnection();
		int result = hdao.hostEnroll(conn, h);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Host selectHostOne(String memberNo) {
		Connection conn= getConnection();
		Host h = hdao.selectHostOne(conn, memberNo);
		close(conn);
		return h;
	}
	
	public int updateHostInfo(String hostInfo, String memberNo) {
		Connection conn = getConnection();
		int result = hdao.updateHostInfo(conn, hostInfo,memberNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Host selectHostInfo(String hostNo) {
		Connection conn =getConnection();
		Host h = hdao.selectHostInfo(conn,hostNo);
		close(conn);
		return h;
	}
	public List<Review> selectHostReview(String hostNo) {
		Connection conn=getConnection();
		List<Review> list = hdao.selectHostReview(conn, hostNo);
		close(conn);
		return list;
	}
	
	public int insertComplaint(Complaint c) {
		Connection conn = getConnection();
		int result = hdao.insertComplaint(conn, c);
		if(result > 0) commit(conn);
		else rollback(conn);
		return result;
	}

}
