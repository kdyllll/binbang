package com.binbang.member.model.service;

import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.commit;
import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.binbang.member.model.dao.FavoriteDao;
import com.binbang.member.model.vo.Favorite;

public class FavoriteService {

	private FavoriteDao dao=new FavoriteDao();
	
	//heart(관심) 누른 숙소를 해당회원 화면에 띄어줌
	public List<Favorite> viewFolder(String memberNo) {
		Connection conn=getConnection();
		List<Favorite> list=dao.viewFolder(conn,memberNo);
		close(conn);
		return list;		
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
	
	//관심숙소 폴더삭제 
	public int deleteFolder(String fNo) {
		Connection conn=getConnection();
		int result=dao.deleteFolder(conn,fNo);
		if(result>0) commit(conn);
		else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
		
	//관심숙소 하나 조회(숙소번호와 폴더번호로)
	public Favorite selectContent(String houseNo,String folderNo,String memberNo) {
		Connection conn=getConnection();
		Favorite f=dao.selectContent(conn,houseNo,folderNo,memberNo);
		close(conn);
		return f;		
	}
	
	//관심숙소 삭제
	public int deleteContent(String houseNo,String folderNo) {
		Connection conn=getConnection();
		int result=dao.deleteContent(conn,houseNo,folderNo);
		if(result>0) commit(conn);
		else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
	//관심숙소 삽입
		public int insertContent(String houseNo,String folderNo) {
			Connection conn=getConnection();
			int result=dao.insertContent(conn,houseNo,folderNo);
			if(result>0) commit(conn);
			else {
				rollback(conn);
				close(conn);
			}
			return result;
		}	
		
		//폴더 이름 수정
		public int modifyFolder(Favorite f) {
			Connection conn=getConnection();
			int result=dao.modifyFolder(conn,f);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;			
		}		
		
		//뒤로가기
		public Favorite selectMemberNo(String memberNo) {
			Connection conn=getConnection();
			Favorite f=dao.selectMemberNo(conn, memberNo);
			close(conn);
			return f;
		}		
		
		//해당 폴더 선택
		public List<Favorite> selectFolder(String folderNo) {
			Connection conn=getConnection();
			List<Favorite> list=dao.selectFolder(conn,folderNo);
			close(conn);
			return list;		
		}				
		
		//관심숙소 내용삭제
		public int removeContent(Favorite f) {
			Connection conn=getConnection();
			int result=dao.removeContent(conn,f);
			if(result>0) commit(conn);
			else {
				rollback(conn);
				close(conn);
			}
			return result;
		}

		
		public Favorite selectFolderName(String no) {
			Connection conn= getConnection();
			Favorite f = dao.selectFolderName(conn, no);
			close(conn);
			return f;
		}
		
}
