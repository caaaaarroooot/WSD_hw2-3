<%@ page import="org.example.hw22.dao.PlayerDAO" %>
<%@ page import="org.example.hw22.bean.PlayerVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");  // 요청 인코딩 설정
    String playerId = request.getParameter("id");
    int id = Integer.parseInt(playerId);
    String name = request.getParameter("name");
    String birthyear = request.getParameter("birthyear");
    String club = request.getParameter("club");
    String country = request.getParameter("country");
    String position = request.getParameter("position");
    String mainfoot = request.getParameter("mainfoot");

    PlayerVO updatePlayer = new PlayerVO(id, name, birthyear, club, country, position, mainfoot);
    PlayerDAO playerDAO = new PlayerDAO();
    playerDAO.updatePlayer(updatePlayer);
    response.sendRedirect("list.jsp");
%>
