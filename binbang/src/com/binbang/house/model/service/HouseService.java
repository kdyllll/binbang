package com.binbang.house.model.service;

import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.commit;
import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.binbang.booking.model.vo.Booking;
import com.binbang.house.model.dao.HouseDao;
import com.binbang.house.model.vo.House;
import com.binbang.house.model.vo.Review;
import com.binbang.member.model.vo.Member;

public class HouseService {
	private HouseDao dao = new HouseDao();


	public House HouseDetail(String no) {
		Connection conn=getConnection();
		House h=dao.HouseDetail(conn, no);
		 close(conn);
		 return h;
	}
	

	
	public Booking selectReservation(String no) {
		Connection conn=getConnection();
		Booking b=dao.selectReservation(conn, no);
		 close(conn);
		 return b;
	}


	public List FilterDetail(String no) {
		Connection conn=getConnection();
		List list=dao.FilterDetail(conn, no);
		 close(conn);
		 return list;
	}
	public String[] housePicture(String no) {
		Connection conn=getConnection();
		String[] list=dao.housePicture(conn, no);
		 close(conn);
		 return list;
	}

	
	public List<Review> ReviewDetail(String no) {
		Connection conn=getConnection();
		List<Review> list = dao.ReviewDetail(conn, no);
		 close(conn);
		 return list;
	}
	

	public House BinbangDetail(int no) {
		Connection conn = getConnection();
		House h = dao.BinbangDetail(conn, no);
		close(conn);
		return h;
	}


	public List selectFilterList(String houseNo) {
		Connection conn = getConnection();
		List list = dao.selectFilterList(conn,houseNo);
		close(conn);
		return list;
	}

	public int HouseCount() {
		Connection conn = getConnection();
		int count = dao.HouseCount(conn);
		close(conn);
		return count;
	}

	public int insertReview(Review r) {
		Connection conn = getConnection();
		int result = dao.insertReview(conn, r);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int insertHouse(House h) {
		Connection conn = getConnection();
		int result = dao.insertHouse(conn, h);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public String selectHouseNo(House h) {
		Connection conn = getConnection();
		String houseNo= dao.selectHouseNo(conn, h);
		close(conn);
		return houseNo;
	}
	
	public int insertFilter(House h,String f) {
		Connection conn = getConnection();
		int result = dao.insertFilter(conn, h, f);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertPeak(House h, String day,String season) {
		Connection conn = getConnection();
		int result = dao.insertPeak(conn,h, day,season);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int insertPicture(House h,String pic,String type) {
		Connection conn = getConnection();
		int result = dao.insertPicture(conn,h,pic,type);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public List<House> selectHostHouse(String hostNo) {
		Connection conn = getConnection();
		List<House> list = dao.selectHostHouse(conn, hostNo);
		close(conn);
		return list;
	}
	

	public List<House> selectHouseList(String location,String checkIn, String checkOut, String pNum, int cPage,int numPerPage){
		Connection conn = getConnection();
		List<House> list = dao.selectHouseList(conn,location,checkIn,checkOut,pNum,cPage,numPerPage);
		close(conn);
		return list;
	}	
	
	
	public Double selectAvgGrade(String houseNo){
		Connection conn = getConnection();
		Double avg = dao.selectAvgGrade(conn, houseNo);
		close(conn);
		return avg;
	}
	
	public List selectPeakDay(House h,String season) {
		Connection conn = getConnection();
		List pList = dao.selectPeakDay(conn,h,season);
		close(conn);
		return pList;
	}

	public int deleteHouse(String houseNo) {
		Connection conn = getConnection();
		int result = dao.deleteHouse(conn, houseNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;

	}
	
	public String[] selectMainPicture(House h) {
		Connection conn = getConnection();
		String[] pictures = dao.selectMainPicture(conn,h);
		close(conn);
		return pictures;
	}
	
	public int houseCount() {
		Connection conn = getConnection();
		int count = dao.houseCount(conn);
		close(conn);
		return count;
	}

	public List<House> selectmyHouse(String hostNo, String memberNo ){
		Connection conn = getConnection();
		List<House> list = dao.selectmyHouse(conn, hostNo, memberNo);
		close(conn);
		return list;
	}

	//숙소 고치기
	public House selectHouseOne(String houseNo) {
		Connection conn = getConnection();
		House h = dao.selectHouseOne(conn, houseNo);
		close(conn);
		return h;
	}

	
	 public List selectPictures(String houseNo) { 
		 Connection conn = getConnection(); 
		 List h = dao.selectSubPictures(conn, houseNo); 
		 close(conn);
		 return h; 
	} 
	 
	 public String[] selectMainPicture(String houseNo) {
		Connection conn = getConnection();
		String[] pictures = dao.selectMainPicture(conn,houseNo);
		close(conn);
		return pictures;
	}
	 
	 public int deleteFilter(String houseNo) {
		 Connection conn= getConnection();
		 int result = dao.deletrFilter(conn, houseNo);
		 if(result > 0) commit(conn);
		 else rollback(conn);
		 close(conn);
		 return result;
	 }
	 public int deletePeakDay(String houseNo) {
		 Connection conn= getConnection();
		 int result = dao.deletePeakDay(conn, houseNo);
		 if(result > 0) commit(conn);
		 else rollback(conn);
		 close(conn);
		 return result;
	 }
	 public int deletePictures(String houseNo) {
		 Connection conn= getConnection();
		 int result = dao.deletePictures(conn, houseNo);
		 if(result > 0) commit(conn);
		 else rollback(conn);
		 close(conn);
		 return result;
	 }
	 
	 public int updateHouse(House h) {
		 Connection conn= getConnection();
		 int result = dao.updateHouse(conn, h);
		 if(result > 0) commit(conn);
		 else rollback(conn);
		 close(conn);
		 return result;
	 }
	 
	 public List selectLocation(String key){
			Connection conn = getConnection();
			List list = dao.selectLocation(conn,key);
			close(conn);
			return list;
	}	
	 
	 public List<House> mainHouse() {
		 Connection conn = getConnection();
		 List<House> list= dao.mainHouse(conn);
		 close(conn);
		 return list;
	 }
	 

}


