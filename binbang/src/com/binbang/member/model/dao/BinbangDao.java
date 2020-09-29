package com.binbang.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class BinbangDao {

	

		private Properties prop=new Properties();
		
		public BinbangDao() {
			try {
				String path=BinbangDao.class.getResource("/sql/binbang/blnbang_sql.properties").getPath();
				prop.load(new FileReader(path));
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		

		public Binbang BinbangDetail(Connection conn, int no) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Binbang b=null;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("bouseView"));
				pstmt.setInt(1, no);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					b=new Binbang();
					b.setHouseNo(rs.getInt("HouseNo")); //숙소번호
					b.setHouseName(rs.getNString("HousseName")); //숙소이름
					b.setHouseComment(rs.getNString("HouseComment")); //숙소소개
					b.setInoutTime(rs.getString("InoutTime")); // 체크인아웃 시간
					b.setNoticeContent(rs.getInt("???")); //요금
					b.setHouseType(rs.getNString("HouseType")); //숙소유형
					b.setHousePnum(rs.getNString("HousePnum")); //숙소최대인원
					b.setBedNum(rs.getNString("BedNum")); //침대갯수
					b.setHouseGemsung(rs.getNString("HouseGemsung")); //감성글
					b.setHouseGrade(rs.getInt("HouseGrade")); //평점
					b.setCommentTitle(rs.getNString("CommentTitle")); //후기제목
					b.setCommentContents(rs.getNString("CommentContents")); //후기내용
					b.setPlaceTitle(rs.getNString("PlaceTitle")); //놀거리 볼거리 제목1
					b.setPlaceContents(rs.getNString("PlaceContents")); //놀거리 볼거리 내용1
					b.setPlaceCategory(rs.getNString("PlaceCategory")); //놀거리 볼거리 분로1
					b.setPlaceTitle(rs.getNString("PlaceTitle")); //놀거리 볼거리 제목2
					b.setPlaceContents(rs.getNString("PlaceContents")); //놀거리 볼거리 내용2
					b.setPlaceCategory(rs.getNString("PlaceCategory")); //놀거리 볼거리 분로2
					b.setPlaceTitle(rs.getNString("PlaceTitle")); //놀거리 볼거리 제목3
					b.setPlaceContents(rs.getNString("PlaceContents")); //놀거리 볼거리 내용3
					b.setPlaceCategory(rs.getNString("PlaceCategory")); //놀거리 볼거리 분로3
					
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return b;
		}
			
	

}
