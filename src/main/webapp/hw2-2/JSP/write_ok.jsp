<%@ page import="org.example.hw22.dao.PlayerDAO" %>
<%@ page import="org.example.hw22.FileUpload" %>
<%@ page import="org.example.hw22.bean.PlayerVO" %><%--
  Created by IntelliJ IDEA.
  User: ijiyun
  Date: 2024. 11. 9.
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    PlayerDAO playerDAO = new PlayerDAO();
    FileUpload upload = new FileUpload();
    PlayerVO vo = upload.uploadFile(request);
    if (vo == null) {
        throw new RuntimeException("PlayerVO 객체 생성 실패: uploadFile(request) 결과가 null입니다.");
    }
    playerDAO.addPlayer(vo);

    response.sendRedirect("list.jsp");
%>

