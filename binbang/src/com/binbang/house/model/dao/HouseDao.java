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
				h.setHouseNo(rs.getString("house_no")); //숙소번호
				h.setHostNo(rs.getString("host_no")); //숙소번호
				h.setHouseName(rs.getNString("house_name")); //숙소이름
				h.setHouseType(rs.getNString("house_type")); //숙소유형
				h.setHouseLocation(rs.getNString("house_location")); //숙소위치
				h.setHousePnum(rs.getInt("house_pnum")); //숙소최대인원
				h.setpObjects(rs.getNString("p_objects")); //개인물건 유무
				h.setRoomNum(rs.getInt("room_num")); //방갯수
				h.setBathNum(rs.getInt("bath_num")); //화장실 갯수
				h.setBedNum(rs.getInt("bed_num")); //침대 갯수
				h.setHouseComment(rs.getNString("House_comment")); //숙소소개
				h.setHouseGemsung(rs.getNString("House_gemsung")); //감성글				
				h.setAttention(rs.getNString("attention")); //주의사항
				h.setInoutTime(rs.getString("inout_time")); // 체크인아웃 시간
				h.setPriceDay(rs.getInt("price_day")); // 비수기 평일
				h.setPriceWeekend(rs.getInt("price_weekend")); //비수기주말
				h.setPricePeakDay(rs.getInt("price_peak_day")); //성수기평일
				h.setPricePeakWeekend(rs.getInt("price_peak_Weekend")); //성수기 주말

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return h;
	}

	// 여기는 숙소에 필터 내용들 출력해주는 다오
	public List selectFilterList(Connection conn,String houseNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectFilterList"));
			pstmt.setString(1,houseNo);		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
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
			pstmt = conn.prepareStatement(prop.getProperty("insertReview"));
		
			pstmt.setString(1, r.getHouseNo());//숙소번호
			pstmt.setString(2, r.getMemberNo());//회원번호
			pstmt.setDouble(3, r.getHouseGrade());//숙소평점
			pstmt.setString(4, r.getCommentTitle());//후기제목
			pstmt.setNString(5, r.getCommentContents());//후기내용
			pstmt.setNString(6, r.getFilePath());//후기사진
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

    
    
	
	//숙소테이블에 인서트하는 다오
	public int insertHouse(Connection conn,House h) {
		PreparedStatement pstmt=null;
		int result=0;		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertHouse"));//? 17개
			pstmt.setString(1, h.getHostNo());
			pstmt.setString(2, h.getHouseName());
			pstmt.setString(3, h.getHouseType());
			pstmt.setString(4, h.getHouseLocation());
			pstmt.setInt(5, h.getHousePnum());
			pstmt.setString(6, h.getpObjects());
			pstmt.setInt(7, h.getRoomNum());
			pstmt.setInt(8, h.getBathNum());
			pstmt.setInt(9, h.getBedNum());
			pstmt.setString(10, h.getHouseComment());
			pstmt.setString(11, h.getHouseGemsung());
			pstmt.setString(12, h.getAttention());
			pstmt.setString(13, h.getInoutTime());
			pstmt.setInt(14, h.getPriceDay());
			pstmt.setInt(15, h.getPriceWeekend());
			pstmt.setInt(16, h.getPricePeakDay());
			pstmt.setInt(17, h.getPricePeakWeekend());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
	}

	//숙소 이름으로 숙소 번호 알아내는 다오
	public String selectHouseNo(Connection conn,House h) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String houseNo="";
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectHouseNo"));
			pstmt.setString(1, h.getHouseName());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				houseNo=rs.getNString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return houseNo;
	
	}
	
	//숙소 필터테이블 인서트하는 다오
	public int insertFilter(Connection conn,House h,String f) {
		PreparedStatement pstmt=null;
		int result=0;		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertFilter"));
			pstmt.setString(1, f);
			pstmt.setString(2, h.getHouseNo());
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;	
	}
	
	//성수기 테이블 인서트하는 다오
	public int insertPeak(Connection conn,House h,String day,String season) {
		PreparedStatement pstmt=null;
		int result=0;		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertPeak"));
			pstmt.setString(1, h.getHouseNo());//숙소번호
			pstmt.setString(2, day);//해당날짜
			pstmt.setString(3, season);//시즌번호
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;	
	}

	public House HouseDetail(Connection conn, String no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		House h=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("houseDetail"));
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				h=new House();
				h.setHouseNo(rs.getString("house_no")); //숙소번호
				h.setHostNo(rs.getString("host_no")); //숙소번호
				h.setHouseName(rs.getNString("house_name")); //숙소이름
				h.setHouseType(rs.getNString("house_type")); //숙소유형
				h.setHouseLocation(rs.getNString("house_location")); //숙소위치
				h.setHousePnum(rs.getInt("house_pnum")); //숙소최대인원
				h.setpObjects(rs.getNString("p_objects")); //개인물건 유무
				h.setRoomNum(rs.getInt("room_num")); //방갯수
				h.setBathNum(rs.getInt("bath_num")); //화장실 갯수
				h.setBedNum(rs.getInt("bed_num")); //침대 갯수
				h.setHouseComment(rs.getNString("House_comment")); //숙소소개
				h.setHouseGemsung(rs.getNString("House_gemsung")); //감성글				
				h.setAttention(rs.getNString("attention")); //주의사항
				h.setInoutTime(rs.getString("inout_time")); // 체크인아웃 시간
				h.setPriceDay(rs.getInt("price_day")); // 비수기 평일
				h.setPriceWeekend(rs.getInt("price_weekend")); //비수기주말
				h.setPricePeakDay(rs.getInt("price_peak_day")); //성수기평일
				h.setPricePeakWeekend(rs.getInt("price_peak_Weekend")); //성수기 주말
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return h;
	}
	
	public House FilterDetail(Connection conn, String no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		House h=new House();
		List l=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectFilterList"));
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				l.add(rs.getNString("filter_icon"));
				//여기에서 파일이름이 리스트에 담김
			}
			h.setFilter(l);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return h;
	}
	
	
	//숙소 후기 조회화는 다오
	public List<Review> ReviewDetail(Connection conn, String no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Review> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("reviewDetail"));
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review r=new Review();
				r.setHouseGrade(Double.parseDouble(rs.getString("house_grade"))); //숙소평점
				r.setCommentTitle(rs.getString("comment_title")); //후기제목
				r.setCommentContents(rs.getNString("comment_contents")); //후기내용
				r.setFilePath(rs.getNString("file_path")); //후기사진
				r.setHouseNo(rs.getNString("house_no")); //숙소번호
				list.add(r);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

	//숙소사진 인서트하는 다오
	public int insertPicture(Connection conn,House h,String pic,String type) {
		PreparedStatement pstmt=null;
		int result=0;		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertPicture"));
			pstmt.setString(1, h.getHouseNo());//숙소번호
			pstmt.setString(2, pic);//사진 이름
			pstmt.setString(3, type);//사진분류
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;	
	}
	
	
	public List<House> selectHostHouse(Connection conn, String hostNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<House> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectHostHouse"));
			pstmt.setString(1, hostNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				House h = new House();
				h.setHouseName(rs.getString("house_name"));
				h.setHouseNo(rs.getString("house_no"));
				list.add(h);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
	}
	

	//검색한 숙소 리스트 받아오는 다오(페이징 처리 포함)
	public List<House> selectHouseList(Connection conn,String location,String checkIn, String checkOut, String pNum,int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<House> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectHouseList"));
			pstmt.setString(1, "%"+location+"%");
			pstmt.setString(2, pNum);
			pstmt.setString(3, checkIn);
			pstmt.setString(4, checkOut);
			pstmt.setInt(5, (cPage-1)*numPerPage+1);
	        pstmt.setInt(6, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				House h = new House();
				h.setHouseNo(rs.getString("house_no")); //숙소번호
				h.setHostNo(rs.getString("host_no")); //숙소번호
				h.setHouseName(rs.getNString("house_name")); //숙소이름
				h.setHouseType(rs.getNString("house_type")); //숙소유형
				h.setHouseLocation(rs.getNString("house_location")); //숙소위치
				h.setHousePnum(rs.getInt("house_pnum")); //숙소최대인원
				h.setpObjects(rs.getNString("p_objects")); //개인물건 유무
				h.setRoomNum(rs.getInt("room_num")); //방갯수
				h.setBathNum(rs.getInt("bath_num")); //화장실 갯수
				h.setBedNum(rs.getInt("bed_num")); //침대 갯수
				h.setHouseComment(rs.getNString("House_comment")); //숙소소개
				h.setHouseGemsung(rs.getNString("House_gemsung")); //감성글				
				h.setAttention(rs.getNString("attention")); //주의사항
				h.setInoutTime(rs.getString("inout_time")); // 체크인아웃 시간
				h.setPriceDay(rs.getInt("price_day")); // 비수기 평일
				h.setPriceWeekend(rs.getInt("price_weekend")); //비수기주말
				h.setPricePeakDay(rs.getInt("price_peak_day")); //성수기평일
				h.setPricePeakWeekend(rs.getInt("price_peak_Weekend")); //성수기 주말
				list.add(h);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	//한 숙소의 평균평점
	public Double selectAvgGrade(Connection conn,String houseNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Double avg=0.0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectAvgGrade"));
			pstmt.setString(1, houseNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				avg=rs.getDouble(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return avg;
	}
	
	//성수기 기간 받아오는 다오
	public List selectPeakDay(Connection conn,House h,String season) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List pList = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectPeakDay"));
			pstmt.setString(1, season);
			pstmt.setString(2, h.getHouseNo());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pList.add(rs.getString(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return pList;
	}

	public int deleteHouse(Connection conn, String houseNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt= conn.prepareStatement(prop.getProperty("deleteHouse"));
			pstmt.setString(1, houseNo);
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	//슥소 메인사진 받아오는 다오
	public String[] selectMainPicture(Connection conn,House h) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] pictures=new String[1];
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMainPicture"));
			pstmt.setString(1, h.getHouseNo());
			pstmt.setString(2, "M");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pictures[0]=rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return pictures;
	}
	
	//숙소 갯수 세는 다오
	public int houseCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("houseCount"));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}


}
