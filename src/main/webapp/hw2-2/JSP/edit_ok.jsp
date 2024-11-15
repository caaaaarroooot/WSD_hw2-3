<%--
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

//    String email = request.getParameter("email");
%>
<html>
<head>
    <meta charset="UTF-8">  <!-- HTML에서 문자 인코딩 설정 -->
    <title>Title</title>
</head>
<body>
<%=name%>님입니다.<br>
<%=birthyear%>님입니다.<br>
<%=club%>님입니다.<br>
<%=country%>님입니다.<br>
<%=position%>님입니다.<br>
<%=mainfoot%>님입니다.<br>
<a href="index.jsp">index</a>
</body>
</html>
