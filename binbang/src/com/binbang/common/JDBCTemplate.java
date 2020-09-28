package com.binbang.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import com.binbang.common.JDBCTemplate;

public class JDBCTemplate {

	public static Connection getConnection() {
		Connection conn=null;
		try {
			Properties prop=new Properties();		
			String path=JDBCTemplate.class.getResource("/driver/driver.properties").getPath();
			prop.load(new FileReader(path));
			Class.forName(prop.getProperty("driver"));
			conn=DriverManager.getConnection(prop.getProperty("url"),
					prop.getProperty("user"),prop.getProperty("pw"));
			conn.setAutoCommit(false);
		}catch(Exception e) {
			e.printStackTrace();
		}return conn;
	}
}
