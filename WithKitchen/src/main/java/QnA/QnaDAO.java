package QnA;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.DBConnPool;


public class QnaDAO extends DBConnPool{

	public int insertQnA(QnaDTO dto) {
		int result=0;
		try {
			String query="insert into QnA(num, id, text, postdate) values (seq_qna_num.NEXTVAL,?,?,sysdate)";
			
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getText());
			result=psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("문의글 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public int deleteQnA(QnaDTO dto) {
		int result=0;
		try {
			String query="delete from QnA where num=?";
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result=psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("문의글 삭제 중 예외 발생");
			e.printStackTrace();
		}return result;
	}
	public int updateEdit(String num,String text) {
		int result=0;
		try {
			String query="update QnA set text=? where num=?";
			psmt=con.prepareStatement(query);
			psmt.setString(1, text);
			psmt.setString(2, num);
			result=psmt.executeUpdate();
			
		} catch (Exception e) {System.out.println(text+" "+num+" "+result);
			System.out.println("문의글 수정 중 예외 발생");
			e.printStackTrace();
		}return result;
	}
	public QnaDTO selectList() {
		QnaDTO dto = new QnaDTO();
		try {
			String query="select * from QnA";
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
			if(rs.next()){
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setText(rs.getString("text"));
				dto.setPostdate(rs.getDate("postdate"));
			}
		} catch (Exception e) {
			System.out.println("문의글 상세보기 중 예외 발생");
			e.printStackTrace();
		}return dto;
	}
	public int selectCount(Map<String,Object>map) {
		int totalcount=0;
		String query="select count(*) from QnA";
		try {
			
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
			rs.next();
			totalcount=rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수 조회 중 예외 발생");
			e.printStackTrace();
		}return totalcount;
	}
	public List<QnaDTO> paging(Map<String, Object> paging){
		List<QnaDTO> bbs = new Vector<QnaDTO>();
		
		String query=
				"select * from (select Tb.*, rownum rNum From"
				+ "(select * from QnA order by num desc)Tb)"
				+ "where rNum between? and ?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, paging.get("start").toString());
			psmt.setString(2, paging.get("end").toString());
			
			rs=psmt.executeQuery();
			while(rs.next()) {
				QnaDTO dto=new QnaDTO();
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setText(rs.getString("text"));
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("페이징 중 예외발생");
			e.printStackTrace();
		}return bbs;
	}
	public QnaDTO selectView(String num) {
		QnaDTO dto = new QnaDTO();
		String query="select * from QnA where num=?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, num);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setText(rs.getString("text"));
			}
		} catch (Exception e) {
			System.out.println("게시물 불러오기 중 예외 발생");
			e.printStackTrace();
		}return dto;
		
	}

}
