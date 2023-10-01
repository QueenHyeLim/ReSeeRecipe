package com.kh.semi.dm.model.dao;

import static com.kh.semi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.dm.model.vo.Dm;

public class DmDao {

	// SQL문 파일 Properties 객체를 이용해서 출력
	private Properties prop = new Properties();
	
	public DmDao() {
		
		String file = DmDao.class.getResource("/sql/dm/dm-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	// DmDao
	
	
	/**
	 * Service에서 요청받은 쪽지함 리스트 조회를 처리해주는 method
	 * @return list
	 */
	public ArrayList<Dm> selectDmList(Connection conn){
		
		ArrayList<Dm> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDmList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Dm dm = new Dm();
				
				dm.setDmNo(rset.getInt("DM_NO"));
				dm.setSendMem(rset.getString("USER_ID"));
				dm.setDmContent(rset.getString("DM_CONTENT"));
				dm.setSendDate(rset.getDate("SEND_DATE"));
				dm.setDmStatus(rset.getString("DM_STATUS"));
				
				list.add(dm);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}	// selectDmList
	
	
	
}	// end class