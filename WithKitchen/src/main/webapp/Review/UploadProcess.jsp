<%@ page import="Review.ReviewDTO"%>
<%@ page import="Review.ReviewDAO"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/Uploads");  // 저장할 디렉터리
int maxPostSize = 1024 * 1000;  // 파일 최대 크기(1MB)
String encoding = "UTF-8";  // 인코딩 방식

try {
    // 1. MultipartRequest 객체 생성
    MultipartRequest mr = new MultipartRequest(request, saveDirectory,
                                               maxPostSize, encoding);

    // 2. 새로운 파일명 생성
    String fileName = mr.getFilesystemName("attachedFile");  // 현재 파일 이름
    String ext = fileName.substring(fileName.lastIndexOf("."));  // 파일 확장자
    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
    String newFileName = now + ext;  // 새로운 파일 이름("업로드일시.확장자")

    // 3. 파일명 변경
    File oldFile = new File(saveDirectory + File.separator + fileName);
    File newFile = new File(saveDirectory + File.separator + newFileName);
    oldFile.renameTo(newFile);

    // 4. 다른 폼값 받기
    String name = mr.getParameter("REV_POTO_NAME");
    String title = mr.getParameter("REV_POTO_TITLE");
    String text = mr.getParameter("REV_TEXT");
    
    String[] cateArray = mr.getParameterValues("REV_GRADE");
    StringBuffer cateBuf = new StringBuffer();
    for (String s : cateArray) {
        cateBuf.append(s + "점");
    }
    

    // 5. DTO 생성
    ReviewDTO dto = new ReviewDTO();
    dto.setREV_POTO_NAME(name);
    dto.setREV_POTO_TITLE(title);
    dto.setREV_TEXT(text);
   
    dto.setREV_GRADE(cateBuf.toString());
    
    dto.setREV_POTO_OFILE(fileName);
    dto.setREV_POTO_SFILE(newFileName);

    // 6. DAO를 통해 데이터베이스에 반영
    ReviewDAO dao = new ReviewDAO();
    dao.insertFile(dto);
    dao.close();

    // 7. 예약확인  JSP로 리디렉션
    response.sendRedirect("../reservation/ReservationCheck.jsp");
}
catch (Exception e) {
    e.printStackTrace();
    request.setAttribute("errorMessage", "파일 업로드 오류");
    request.getRequestDispatcher("ReviewMain.jsp").forward(request, response);
}
%>

