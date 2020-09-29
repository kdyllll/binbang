package com.binbang.house.model.dao;
import static com.binbang.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.binbang.house.model.vo.House;

public class HouseDao {

	

		private Properties prop=new Properties();
		
		public HouseDao() {
			try {
				String path=HouseDao.class.getResource("/sql/binbang/blnbang_sql.properties").getPath();
				prop.load(new FileReader(path));
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		

		public House BinbangDetail(Connection conn, int no) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			House h=null;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("bouseView"));
				pstmt.setInt(1, no);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					h=new House();
					h.setHouseNo(rs.getString("houseNo")); //숙소번호
					h.setHouseName(rs.getNString("houseName")); //숙소이름
					h.setHouseType(rs.getNString("houseType")); //숙소유형
					h.setHouseLocation(rs.getNString("houseLocation")); //숙소위치
					h.setHousePnum(rs.getInt("HousePnum")); //숙소최대인원
					h.setpObjects(rs.getNString("pObjects")); //개인물건 유무
					h.setRoomNum(rs.getInt("roomNum")); //방갯수
					h.setBathNum(rs.getInt("bathNum")); //화장실 갯수
					h.setBedNum(rs.getInt("bedNum")); //침대 갯수
					h.setHouseComment(rs.getNString("HouseComment")); //숙소소개
					h.setHouseGemsung(rs.getNString("HouseGemsung")); //감성글
					h.setPhoneOption(rs.getNString("phoneOption")); //
					h.setAttention(rs.getNString("attention")); //
					h.setInoutTime(rs.getString("inoutTime")); // 체크인아웃 시간
					h.setPriceDay(rs.getInt("priceDay")); // 비수기 평일
					h.setPriceWeekend(rs.getInt("priceWeekend")); //비수기주말
					h.setPricePeakDay(rs.getInt("pricePeakDay")); //성수기평일
					h.setPricePeakWeekend(rs.getInt("pricePeakWeekend")); //성수기 주말
					
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return h;
		}
			
	

}
