package Post;


import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import Post.PostDTO;


public class PostDAO extends DBConnPool{
	
	
		//kit_post테이블에 공간글쓰기 저장
		public int insertWrite(PostDTO dto)
		{
			int result=0;
			try {
				String query= "insert into kit_post ("
						 + " kit_num, kit_id, kit_name, kit_cap, kit_add, kit_info, opt, res_start, res_end, res_fee, kit_tel, kit_address_1st, kit_address_2nd, filename, "
						 + " kit_intro, kit_tag, kit_url, kit_notice )"
						 + " values ( seq_kit_post_num.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				//System.out.println(dto.getKit_id());
				psmt=con.prepareStatement(query);
				
				psmt.setString(1, dto.getKit_id()); //조인용
				psmt.setString(2, dto.getKit_name());//주방명
				psmt.setString(3, dto.getKit_cap());//예약인원
				psmt.setString(4, dto.getKit_add());//추가 인원
				psmt.setString(5, dto.getKit_info());//시설안내
				psmt.setString(6, dto.getOpt());
				psmt.setString(7, dto.getRes_start());//대여 시작일
				psmt.setString(8, dto.getRes_end());//대여 종료일
				psmt.setString(9, dto.getRes_fee());//희망대여금액
				psmt.setString(10, dto.getKit_tel());//연락처
				psmt.setString(11, dto.getKit_address_1st());//주소
				psmt.setString(12, dto.getKit_address_2nd());//상세주소
				psmt.setString(13,dto.getFilename());//대표이미지
				psmt.setString(14, dto.getKit_intro());//한줄소개
				psmt.setString(15, dto.getKit_tag());//태그
				psmt.setString(16, dto.getKit_url());//웹사이트
				psmt.setString(17, dto.getKit_notice());//주의사항
						
				result=psmt.executeUpdate();
				
			}catch(Exception e)
			{
				System.out.println("게시물 입력중 예외발생");
				e.printStackTrace();
			}
			
			return result;
				
		}
		
	
		public PostDTO selectView(String num)
		{
			PostDTO dto=new PostDTO();//해당 num값의 board테이블의 row(한줄=글정보)값을 담는다.
			String query="select kit_num,kit_name,kit_address_1st,kit_address_2nd,kit_info,kit_intro,kit_notice from kit_post  where num=?";
			//쿼리문 작성
			try {
				psmt=con.prepareStatement(query);
				psmt.setString(1, num);
				rs=psmt.executeQuery();
				
				//결과처리
				if(rs.next())
				{
					dto.setKit_num(rs.getString(1));
					dto.setKit_name(rs.getString(2));
					dto.setKit_address_1st(rs.getString(3));
					dto.setKit_address_2nd(rs.getString(4));
					dto.setKit_info(rs.getString(5));
					dto.setKit_intro(rs.getString(6));
					dto.setKit_notice(rs.getString(7));
					
				}
			}catch(Exception e){
				System.out.println("게시물상세보기 중 예외 발생");
				e.printStackTrace();
			}
			return dto;
		}
		
		
		public List<PostDTO> selectList(Map<String,Object>map)
		{
			List<PostDTO> bbs=new Vector<PostDTO>();//결과 (게시물 목록)을 담을 변수
			//리스트를 쓴이유: 순서대로 출력 하기 위해서 (List계열의 collection은 데이터가 순서대로 저장되어 인덱스를 통해 가져올수 있기 때문에)
			//(비슷한 이유로 Array써로 됨)
			String query="select * from kit_post ";
			if(map.get("searchWord")!=null)
			{
				query+=" where "+map.get("searchField")+" "+" like '%"+map.get("searchWord")+"%' ";
			}
			query+="order by kit_num desc";//없으면 최근 게시물순으로  select
			
			try {
				stmt=con.createStatement();
				rs=stmt.executeQuery(query);
				
				//rs값이 많으므로 while문을 사용해서 게시물 하나씩 bbs에  저장
				while(rs.next())
				{
					PostDTO dto= new PostDTO();
					dto.setKit_num("kit_num");//일련번호
					dto.setKit_name(rs.getString("kit_name"));//주방명
					dto.setKit_intro(rs.getString("kit_intro"));//한줄소개
					dto.setKit_tel(rs.getString("kit_tel"));//연락처
					dto.setKit_id(rs.getString("kit_id"));
					
					bbs.add(dto);//결과 목록에 저장
				}
				
			}catch(Exception e)
			{
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			
			return bbs;
		}
		public int selectCount(Map<String,Object> map)
		{	
			int totalcount=0;//결과(게시물수)를 담을 변수
			//1.동적 쿼리 생성	
			String query="select count(*) from kit_post";
			if(map.get("searchWord")!=null)
			{
				query+=" where"+map.get("searchField")+""+" Like '%"+map.get("searchWord")+ "%'";
			}
			
			//2.쿼리문 실행
			try {
				
				stmt=con.createStatement();
				rs=stmt.executeQuery(query);//쿼리문 실행
				rs.next();//커서를 첫번째 행으로 이동
				totalcount=rs.getInt(1);//첫번째 컬럼값을 가져옴
			
			}catch(Exception e){
				System.out.println("게시물수를 구하는 중 예외발생!");
				e.printStackTrace();
			}
		
			return totalcount;
		}
		public int deletePost(PostDTO dto) {
			int result=0;
			
			try {
				String query="delete from kit_post where kit_num=?";
			
				psmt=con.prepareStatement(query);
				psmt.setString(1, dto.getKit_num());
				
				result=psmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("게시물 삭제 중 예외발생");
				e.printStackTrace();
			}
			
			
			return result;
		}
		
	
}
