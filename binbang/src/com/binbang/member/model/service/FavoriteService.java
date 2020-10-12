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
	
	//heart(관심) 누른 숙소를 해당회원 화면에 띄어줌
	public Favorite viewFolder(String memberNo) {
		Connection conn=getConnection();
		Favorite f=dao.viewFolder(conn,memberNo);
		close(conn);
		return f;		
	}
	
	
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
