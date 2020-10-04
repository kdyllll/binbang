package com.binbang.house.model.dao;

import static com.binbang.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.binbang.house.model.vo.House;
import com.binbang.house.model.vo.Review;

public class HouseDao {

	private Properties prop = new Properties();

	public HouseDao() {
		try {
			String path = HouseDao.class.getResource("/sql/house/house_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public House BinbangDetail(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		House h = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("bouseView"));
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				h = new House();
				h.setHouseNo(rs.getString("houseNo")); // 숙소번호
				h.setHouseName(rs.getNString("houseName")); // 숙소이름
				h.setHouseType(rs.getNString("houseType")); // 숙소유형
				h.setHouseLocation(rs.getNString("houseLocation")); // 숙소위치
				h.setHousePnum(rs.getInt("HousePnum")); // 숙소최대인원
				h.setpObjects(rs.getNString("pObjects")); // 개인물건 유무
				h.setRoomNum(rs.getInt("roomNum")); // 방갯수
				h.setBathNum(rs.getInt("bathNum")); // 화장실 갯수
				h.setBedNum(rs.getInt("bedNum")); // 침대 갯수
				h.setHouseComment(rs.getNString("HouseComment")); // 숙소소개
				h.setHouseGemsung(rs.getNString("HouseGemsung")); // 감성글
				h.setPhoneOption(rs.getNString("phoneOption")); //
				h.setAttention(rs.getNString("attention")); //
				h.setInoutTime(rs.getString("inoutTime")); // 체크인아웃 시간
				h.setPriceDay(rs.getInt("priceDay")); // 비수기 평일
				h.setPriceWeekend(rs.getInt("priceWeekend")); // 비수기주말
				h.setPricePeakDay(rs.getInt("pricePeakDay")); // 성수기평일
				h.setPricePeakWeekend(rs.getInt("pricePeakWeekend")); // 성수기 주말

			}
<<<<<<< HEAD
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return h;
	}

	// 여기는 숙소에 필터 내용들 출력해주는 다오

	public List<House> HouseFilterList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<House> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty(""));
			// cPage 1 : 1|5
			// cPage 2 : 6|10
			// cPage 3 : 11|15
			// cPage 4 : 16|20
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				House h = new House();
				h = new House();
				h.setHouseNo(rs.getString("houseNo")); // 숙소번호
				h.setHouseName(rs.getNString("houseName")); // 숙소이름
				h.setHouseType(rs.getNString("houseType")); // 숙소유형
				h.setHouseLocation(rs.getNString("houseLocation")); // 숙소위치
				h.setHousePnum(rs.getInt("HousePnum")); // 숙소최대인원
				h.setpObjects(rs.getNString("pObjects")); // 개인물건 유무
				h.setRoomNum(rs.getInt("roomNum")); // 방갯수
				h.setBathNum(rs.getInt("bathNum")); // 화장실 갯수
				h.setBedNum(rs.getInt("bedNum")); // 침대 갯수
				h.setHouseComment(rs.getNString("HouseComment")); // 숙소소개
				h.setHouseGemsung(rs.getNString("HouseGemsung")); // 감성글
				h.setPhoneOption(rs.getNString("phoneOption")); //
				h.setAttention(rs.getNString("attention")); //
				h.setInoutTime(rs.getString("inoutTime")); // 체크인아웃 시간
				h.setPriceDay(rs.getInt("priceDay")); // 비수기 평일
				h.setPriceWeekend(rs.getInt("priceWeekend")); // 비수기주말
				h.setPricePeakDay(rs.getInt("pricePeakDay")); // 성수기평일
				h.setPricePeakWeekend(rs.getInt("pricePeakWeekend")); // 성수기 주말
				list.add(h);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

	// 펄터 전체 갯수 세어주는 다오
	public int HouseCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty(""));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(prop.getProperty(""));
			pstmt.setDouble(1, r.getHouseGrade());
			pstmt.setString(2, r.getCommentTitle());
			pstmt.setNString(3, r.getCommentContents());
			pstmt.setNString(4, r.getFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}=======

	public int insertHouse(Connection conn,House h) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertHouse"));
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
	}

	>>>>>>>branch'develop'

	of https:// github.com/kdyllll/binbang.git

}
