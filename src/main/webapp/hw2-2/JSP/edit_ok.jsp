<%@ page import="org.example.hw22.dao.PlayerDAO" %>
<%@ page import="org.example.hw22.bean.PlayerVO" %>
<%@ page import="org.example.hw22.FileUpload" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");  // 요청 인코딩 설정
    PlayerDAO playerDAO = new PlayerDAO();
    FileUpload upload = new FileUpload();
    PlayerVO vo = upload.uploadFile(request);
    if (vo == null) {
        throw new RuntimeException("PlayerVO 객체 생성 실패: uploadFile(request) 결과가 null입니다.");
    }

    playerDAO.updatePlayer(vo);
    response.sendRedirect("list.jsp");
%>

