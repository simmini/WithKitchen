<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="Post.PostDAO" %>
<%@ page import="Post.PostDTO" %>   
    
<%
String saveDirectory = application.getRealPath("/Uploads");  // 저장할 디렉터리
int maxPostSize = 1024 * 1000;  // 파일 최대 크기(1MB)
String encoding = "UTF-8";  // 인코딩 방식

try {
    // 1. MultipartRequest 객체 생성
    MultipartRequest mr = new MultipartRequest(request, saveDirectory,maxPostSize, encoding);
	String filename = mr.getFilesystemName("attachedFile");  // 현재 파일 이름
	
	//폼에서 값 받기
	request.setCharacterEncoding("utf-8");
	String kit_id="scott";
	String kit_name	= mr.getParameter("kit_name");
	String kit_cap	= mr.getParameter("kit_cap");
	String kit_add	= mr.getParameter("kit_add");
	String kit_info	= mr.getParameter("kit_info");
	
	
	String[] optArray=mr.getParameterValues("opt");
	StringBuffer optBuf=new StringBuffer();
	if(optArray==null)
		optBuf.append("선택 없음");
	else
	{
		for(String s:optArray)
		{
			optBuf.append(s+", ");
		}
	}
	
	String res_start=mr.getParameter("res_start");
	String res_end	=mr.getParameter("res_end");
	String res_fee	=mr.getParameter("res_fee");
	
	String kit_tel   =mr.getParameter("kit_tel");
	String kit_address_1st=mr.getParameter("kit_address_1st");
	String kit_address_2nd=mr.getParameter("kit_address_2nd");
	
	String kit_intro=mr.getParameter("kit_intro");
	String kit_tag=mr.getParameter("kit_tag");
	String kit_url=mr.getParameter("kit_url");
	String kit_notice=mr.getParameter("kit_notice");
	
	
	//postDTO객체에 저장
	PostDTO dto=new PostDTO();
	dto.setKit_name(kit_name);//주방명
	dto.setKit_id(kit_id);//게시물 아이디
	dto.setKit_cap(kit_cap);//예약인원
	dto.setKit_add(kit_add);//추가인원
	dto.setKit_info(kit_info);//시설안내
	dto.setOpt(optBuf.toString());//체크박스 여러값 저장
	dto.setRes_start(res_start);//대여시작일
	dto.setRes_end(res_end);//대여 종료일
	dto.setRes_fee(res_fee);//희망 대여 금액
	dto.setKit_tel(kit_tel);//연락처
	dto.setKit_address_1st(kit_address_1st);
	dto.setKit_address_2nd(kit_address_2nd);
	dto.setFilename(filename);//이미지파일명으로 불러옴
	dto.setKit_tag(kit_tag);//태그
	dto.setKit_url(kit_url);//웹사이트
	dto.setKit_notice(kit_notice);//예의 주의사항
	out.print(kit_id);
	out.print(kit_name);
	out.print(kit_cap);
	out.print(kit_add);
	out.print(kit_info);
	out.print(optBuf.toString());
	out.print(res_start);
	out.print(res_end);
	out.print(res_fee);
	out.print(kit_tel);
	out.print(kit_address_1st);
	out.print(kit_address_2nd);
	out.print(filename);
	out.print(kit_tag);
	out.print(kit_url);
	out.print(kit_notice);
	
	
	//dto객체를 통해 DB에 DTO저장
	PostDAO dao=new PostDAO();
	int iResult=dao.insertWrite(dto);
	dao.close();
	
	
	//글 DB입력 성공과 실패 여부
	if(iResult==1)
		{out.print("성공");
		response.sendRedirect("Post_list.jsp");//List?????/.jsp
		}
	else
	{
		out.print("오류");
		request.getRequestDispatcher("Post_list.jsp");
	}
	//response.sendRedirect("Post_form.jsp");
	
	}
	catch (Exception e)
	{
		  e.printStackTrace();
		   request.setAttribute("errorMessage", "파일 업로드 오류");
	}

%>