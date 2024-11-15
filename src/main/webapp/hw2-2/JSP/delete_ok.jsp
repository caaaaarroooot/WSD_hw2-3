<%--
  Created by IntelliJ IDEA.
  User: ijiyun
  Date: 2024. 11. 9.
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String playerId = request.getParameter("id");
    // playerId를 사용하여 삭제 작업 수행 등
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    삭제할 id는 <%=playerId%>입니다<br>
    <a href="index.jsp">index</a>
</body>
</html>
