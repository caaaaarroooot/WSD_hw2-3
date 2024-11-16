<%@ page import="org.example.hw22.dao.PlayerDAO" %><%--
  Created by IntelliJ IDEA.
  User: ijiyun
  Date: 2024. 11. 9.
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String playerId = request.getParameter("id");
    if (playerId != null && !playerId.isEmpty()) {
        int id = Integer.parseInt(playerId);
        PlayerDAO playerDAO = new PlayerDAO();
        playerDAO.deletePlayerById(id);
        response.sendRedirect("list.jsp");
        return;
    }
%>

