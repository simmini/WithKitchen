package membership;

import common.DBConnPool;

public class MemberCheckDAO extends DBConnPool{
	
	
	
	
	// DB 연결하는 과정은 패턴이다 다음과 같은 코드가 반복된다
	// ------------------------------------------------------------------------------
	public MemberCheckDAO() {
		
	}
	
	public MemberCheckDTO getMemberDTO(String uid, String upwd) {
		
		MemberCheckDTO dto = new MemberCheckDTO();
		
		String query = "select M_ID, M_PASSWORD, M_NAME from MEMBER where M_ID = ? and M_PASSWORD = ?";
		
		try {
			
			// 여기에 있는 con은 부모것이다 자식 클래스에서 상속받아서 사용하고있다
			// super 덕이라는데 어떤건지 체크할것
			psmt = con.prepareStatement(query);
			psmt.setString(1,uid);
			psmt.setString(2,upwd);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("M_ID"));
				dto.setPwd(rs.getString("M_PASSWORD"));
				dto.setName(rs.getString(3));
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return dto;
		
	}
	//-----------------------------------------------------------------------------------------
	
	// 아이디 중복 체크
	
public int checkId(String uid) {
	
	int result = -1;
		
		MemberCheckDTO dto = new MemberCheckDTO();
		
		String query = "select M_ID from MEMBER where M_ID = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1,uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 0;
			} else {
				result = 1;
			}
			System.out.println("아이디 중복체크결과 : "+result);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
		
	}

//-------------------------------------------------

public int duplecateID(String id){
	int cnt=0;
    try{
    	
    	MemberCheckDTO dto = new MemberCheckDTO();
		
		String query = "select count(M_ID) as cnt from MEMBER where M_ID = ?";   
		
		psmt = con.prepareStatement(query);
		psmt.setString(1,id);
		rs = psmt.executeQuery();
        
        if(rs.next()){
        	cnt=rs.getInt("cnt");
        } else {
        	System.out.println("아이디 중복 확인 실패");
        }
    }catch(Exception e){
     	System.out.println("아이디 중복 확인 실패 : " + e);
    }//try end
    return cnt;
}//duplecateID end

	

// --------------------------------------------



// 회원정보 수정시 현재 기본정보 받기 



public MemberCheckDTO getMemUdt(String uid) {
	
	MemberCheckDTO dto = new MemberCheckDTO();
	
	String query = "select M_ID, M_NAME, M_TEL, M_EMAIL, M_BUS from MEMBER where M_ID = ?";
	
	try {
		
		psmt = con.prepareStatement(query);
		psmt.setString(1,uid);
		rs = psmt.executeQuery();
		
		if(rs.next()) {
			dto.setId(rs.getString("M_ID"));
			dto.setName(rs.getString(2));
			dto.setTel(rs.getString(3));
			dto.setEmail(rs.getString(4));
			dto.setBus(rs.getString(5));
			
		}
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		System.out.println("정보수정 쿼리에서 예외 발생");
	}
	return dto;
	
}


// ---------------------------------------

// 정보 수정 쿼리문 

public int udtMember(MemberCheckDTO dto) {
	
	int result = 0;
	
	try {
		
		String query = "UPDATE MEMBER SET "
				+ "M_ID = ? , M_PASSWORD = ?, M_TEL = ?, M_EMAIL = ?, M_BUS = ? "
				+ "where M_ID = ?";
		
		psmt = con.prepareStatement(query);
		psmt.setString(1, dto.getId());
		psmt.setString(2, dto.getPwd());
		psmt.setString(3, dto.getTel());
		psmt.setString(4, dto.getEmail());
		psmt.setString(5, dto.getBus());
		psmt.setString(6, dto.getId());
		
		result = psmt.executeUpdate();

		
		
		
	} catch (Exception e) {
		
		System.out.println("회원정보 수정중 예외 발생");
		e.printStackTrace();
	}
	
	
	return result;
	
}


// ------------------------------------------------

// 회원 정보 삭제


public int delMember(String uid) {
	
	int result = 0;
	
	try {
		
		String query = "DELETE FROM MEMBER WHERE M_ID = ?";
		
		psmt = con.prepareStatement(query);
		psmt.setString(1, uid);
		
		result = psmt.executeUpdate();

		
		
		
	} catch (Exception e) {
		
		System.out.println("회원 삭제중 예외 발생");
		e.printStackTrace();
	}
	
	
	return result;
	
}









}
