package res;

import org.apache.naming.java.javaURLContextFactory;



import common.DBConnPool;


public class ResDAO extends DBConnPool {


	
	// RESERVATION 테이블에 예약 정보 저장
	public int insertReservation(ResDTO dto) {
		
		int result=0;
		
	
		

		
		try {
			

			String query=" INSERT INTO reservation(res_no, res_purpose, res_request, res_people, res_date) VALUES(seq_res_num.nextval, ?, ?, ?, ?)";
				

			
			psmt=con.prepareStatement(query);
		
			psmt.setString(1, dto.getRes_purpose());
			psmt.setString(2, dto.getRes_request());
			psmt.setString(3, dto.getRes_people());
			psmt.setString(4, dto.getRes_date());

			result = psmt.executeUpdate();
		
			
		} catch (Exception e) {
			System.out.println("게시물 입력중 예외발생");
			e.printStackTrace();
		}
		
		return result;
		
	}
	



//------------------------------------------------

//예약 삭제


public int delReservation(String res_no) {
	
	int result = 0;
	
	try {
		
		String query = "DELETE FROM reservation WHERE res_no = ?";
		
		psmt = con.prepareStatement(query);
		psmt.setString(1, res_no);
		
		result = psmt.executeUpdate();

		
		
		
	} catch (Exception e) {
		
		System.out.println("예약 정보 삭제 중 예외 발생");
		e.printStackTrace();
	}
	
	
	return result;
	
}


}



