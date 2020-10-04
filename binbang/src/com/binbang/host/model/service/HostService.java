package com.binbang.host.model.service;

import com.binbang.host.model.dao.HostDao;
import com.binbang.host.model.vo.Host;
import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.rollback;
import static com.binbang.common.JDBCTemplate.commit;

import java.sql.Connection;

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
}
