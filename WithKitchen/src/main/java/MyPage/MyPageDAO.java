package MyPage;

import java.util.List;
import java.util.Vector;


import common.DBConnPool;


public class MyPageDAO extends DBConnPool{

	 
	public MyPageDAO(){}
	
	
	public MyPageDTO getMemberDTO(String M_ID , String M_NAME ) {
		MyPageDTO dto = new MyPageDTO();
		String query ="SELECT * FROM member WHERE M_ID =? AND M_NAME =? ";
		
		try {
			psmt =con.prepareStatement(query);
			psmt.setString(1, M_ID);
			psmt.setString(2, M_NAME);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setM_ID(rs.getString("M_ID"));
				dto.setM_NAME(rs.getNString("M_NAME"));
			}
			
			
		}catch (Exception e) {
			System.out.println("select중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
}

	
	
	
	
	
	
	

