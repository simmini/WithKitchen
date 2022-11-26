package MemberJoin;


import common.DBConnPool;

public class MemberJoinDAO extends DBConnPool{ // 컨넥트하는 자바파일하고 web.xml을 통일 시켜야함

	
	// 회원 정보 db에 입력하는 메소드
	public MemberJoinDAO() {

	}
	
	
	public int insertMember(MemberJoinDTO dto) {
		int result = 0;
		
		// Insert 쿼리문 작성
		// 동적 쿼리 실행
		
		
		try {
			
			//------------------------!!!!!!!!!!!!!!!!--------------------
			

			
			String query = "insert into MEMBER ( "
					+ "M_NUM, M_ID , M_PASSWORD , M_NAME , M_TEL , M_EMAIL, M_BUS) "
					+ " values ( "
					+ " seq_member_num.nextval, ?, ?, ?, ?, ?, ?)";
			
			
			//------------------!!!!!!!!!!!!!!!!!!!------------------

			
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getBus());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("회원 정보 입력중 예외 발생");
			e.printStackTrace();
		}
		
		
		// 결과값 처리
		
		
		
		return result;
	}
	
	
	// -------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
