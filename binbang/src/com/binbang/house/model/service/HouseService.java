package com.binbang.house.model.service;

import static com.binbang.common.JDBCTemplate.close;
import static com.binbang.common.JDBCTemplate.commit;
import static com.binbang.common.JDBCTemplate.getConnection;
import static com.binbang.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.binbang.house.model.dao.HouseDao;
import com.binbang.house.model.vo.House;
import com.binbang.house.model.vo.Review;

public class HouseService {
	private HouseDao dao = new HouseDao();


	public House HouseDetail(int no) {
		Connection conn=getConnection();
		House h=dao.HouseDetail(conn, no);
		 close(conn);
		 return h;
	}
	

	public House BinbangDetail(int no) {
		Connection conn = getConnection();
		House h = dao.BinbangDetail(conn, no);
		close(conn);
		return h;
	}


	public List<House> HouseFilterList(int cPage, int numPerPage) {
		Connection conn = getConnection();

		List<House> list = dao.HouseFilterList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int HouseCount() {
		Connection conn = getConnection();
		int count = dao.HouseCount(conn);
		close(conn);
		return count;
	}

	public int insertReview(Review R) {
		Connection conn = getConnection();
		int result = dao.insertReview(conn, R);
		// 트렌젝션처리
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
	

	public List<House> selectHouseAll(){
		Connection conn = getConnection();
		List<House> list = dao.selectHouseAll(conn);
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


}


