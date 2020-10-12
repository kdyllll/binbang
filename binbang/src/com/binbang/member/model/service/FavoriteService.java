package com.binbang.member.model.service;

import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.commit;
import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.binbang.member.model.dao.FavoriteDao;
import com.binbang.member.model.vo.Favorite;

public class FavoriteService {

	private FavoriteDao dao=new FavoriteDao();
	
	//관심숙소 폴더 생성
	public int createFolder(Favorite f) {
		Connection conn=getConnection();
		int result=dao.createFolder(conn,f);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
}
