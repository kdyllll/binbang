package com.binbang.house.model.service;

import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.binbang.house.model.dao.HouseDao;
import com.binbang.house.model.vo.House;

public class HouseService {
	private HouseDao dao=new HouseDao();

	public House BinbangDetail(int no) {
		Connection conn=getConnection();
		House b=dao.BinbangDetail(conn, no);
		 close(conn);
		 return b;
	
	}
	
}
