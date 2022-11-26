package Review;

import java.util.List;
import java.util.Vector;

import MyPage.MyPageDTO;
import common.DBConnPool;
import Review.ReviewDTO;

public class ReviewDAO extends DBConnPool{
	
	public int insertFile(ReviewDTO dto) {
		int result=0;
		try {
			String query = "INSERT INTO REVIEW ( "
							+" REV_ID, REV_GRADE, REV_TEXT, REV_POTO_NAME, REV_POTO_TITLE, REV_POTO_OFILE, REV_POTO_SFILE)"
							+" VALUES ( "
							+"  seq_reivew_num.nextval, ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			 
			psmt.setString(1, dto.getREV_GRADE());
			psmt.setString(2, dto.getREV_TEXT());
			psmt.setString(3, dto.getREV_POTO_NAME());
			psmt.setString(4, dto.getREV_POTO_TITLE());
			psmt.setString(5, dto.getREV_POTO_OFILE());
			psmt.setString(6, dto.getREV_POTO_SFILE());
			
			result = psmt.executeUpdate();
			
			} catch (Exception e) {
			
			System.out.println("INSERT중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	// 예약 정보 가져오기
	/*public RestDTO getRestDTO(String res_id) {
		RestDTO res_dto = new RestDTO();
		String query ="SELECT * FROM RESERVATION WHERE RES_ID";
		
		try {
			psmt =con.prepareStatement(query);
			psmt.setString(1, res_id);
			psmt.setString(2, res_name);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setM_ID(rs.getString("res_id"));
				dto.setM_NAME(rs.getNString("res_name"));
			}
			
			
		}catch (Exception e) {
			System.out.println("select중 예외 발생");
			e.printStackTrace();
			
		}
		return res_dto;
	}
	
	*/
	
}
	
