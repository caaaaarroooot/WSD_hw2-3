<%@ page import="org.example.hw22.dao.PlayerDAO" %><%--
  Created by IntelliJ IDEA.
  User: ijiyun
  Date: 2024. 11. 9.
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");  // 요청 인코딩 설정
    String name = request.getParameter("name");
    String birthyear = request.getParameter("birthyear");
    String club = request.getParameter("club");
    String country = request.getParameter("country");
    String position = request.getParameter("position");
    String mainfoot = request.getParameter("mainfoot");

    PlayerDAO playerDAO = new PlayerDAO();
    playerDAO.addPlayer(name, birthyear, club, country, position, mainfoot);
    response.sendRedirect("list.jsp");
%>

