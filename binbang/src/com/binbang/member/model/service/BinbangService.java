package com.binbang.member.model.service;

import java.sql.Connection;
import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.commit;
import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.rollback;

import com.binbang.member.model.dao.BinbangDao;

public class BinbangService {
	private BinbangDao dao=new BinbangDao();

	public Binbang BinbangDetail(int no) {
		Connection conn=getConnection();
		Binbang b=dao.BinbangDetail(conn, no);
		 close(conn);
		 return b;
	
	}
	
}
