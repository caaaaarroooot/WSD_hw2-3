<%--
  Created by IntelliJ IDEA.
  User: ijiyun
  Date: 2024. 11. 11.
  Time: 오전 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <jsp:useBean id="user" class="org.example.jspproject.UserInfo" scope="session" />
  <jsp:setProperty name="user" property="*" />

  LoginInfo:<br>
  User ID: <jsp:getProperty name="user" property="username"/><br>
  password: <jsp:getProperty name="user" property="password"/><br>
  <a href="welcome.jsp">move to welcome!!</a>
</body>
</html>